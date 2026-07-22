#!/usr/bin/env python3
"""
check-syntax.py — validate the syntax of PR-modified config/content files.

Called by .github/workflows/pr-syntax-check.yml with a list of changed file
paths. Each file is validated according to its type (see CHECKERS below). The
goal is *syntax validity only* — is the file parseable / well-formed — not
style or formatting opinions.

Output:
  - GitHub Actions error annotations (::error file=...,line=...::message) for
    every problem. These render inline on the PR "Files changed" tab and work
    for fork PRs too, since they come from the check run rather than the API.
  - A findings JSON file (path given by --findings-out) that a later workflow
    step reads to (a) post inline review suggestions on same-repo PRs and
    (b) fail the job when non-empty.

This script itself always exits 0 — failing the job is the enforce step's
job, so that annotations print and suggestions post first regardless.

A "suggestion" in a finding is an unambiguous one-line fix (e.g. a Makefile
recipe line that must start with a tab). Genuine syntax breaks (a missing
JSON brace, bad YAML indentation) get a precise location + parser message but
no suggestion, because the correct repair cannot be guessed reliably.
"""

import argparse
import json
import os
import re
import sys

# packaging + pyyaml are installed by the workflow (pip install) before this
# script runs. Import lazily inside the checkers so a missing dep only affects
# the relevant type rather than aborting the whole run.


def _finding(path, line, col, message, suggestion=None):
    """Build one finding dict. `suggestion`, if given, is the full replacement
    text for `line` (1-based) offered as a one-click review suggestion."""
    return {
        "path": path,
        "line": max(1, int(line)),
        "col": max(1, int(col)) if col else 1,
        "message": message,
        "suggestion": suggestion,
    }


def _escape_data(value):
    """Escape a workflow-command *message*. GitHub decodes these sequences,
    so untrusted text (e.g. an invalid requirement string from the PR) must be
    escaped or it could inject additional ::commands. Escape % first so the
    %0A/%0D we introduce aren't themselves re-escaped."""
    return (
        str(value)
        .replace("%", "%25")
        .replace("\r", "%0D")
        .replace("\n", "%0A")
    )


def _escape_property(value):
    """Escape a workflow-command *property* value (e.g. file). Same as data,
    plus ':' and ',' which are property delimiters."""
    return _escape_data(value).replace(":", "%3A").replace(",", "%2C")


def check_yaml(path, text):
    """Validate YAML syntax. Uses compose_all, which parses the node graph
    without constructing Python objects — so it tolerates the
    `!!python/name:...` tags in config/*/mkdocs.yml that a plain safe_load
    would reject with a false 'could not determine a constructor' error."""
    import yaml

    findings = []
    try:
        # Consume the generator so multi-document files are fully parsed.
        list(yaml.compose_all(text))
    except yaml.YAMLError as exc:
        line, col = 1, 1
        mark = getattr(exc, "problem_mark", None)
        if mark is not None:
            line, col = mark.line + 1, mark.column + 1
        problem = getattr(exc, "problem", None) or str(exc).splitlines()[0]
        findings.append(_finding(path, line, col, f"Invalid YAML: {problem}"))
    return findings


def check_json(path, text):
    """Validate JSON syntax."""
    findings = []
    try:
        json.loads(text)
    except json.JSONDecodeError as exc:
        findings.append(
            _finding(path, exc.lineno, exc.colno, f"Invalid JSON: {exc.msg}")
        )
    return findings


def check_requirements(path, text):
    """Validate each requirement specifier in a pip requirements file.

    Skips blanks, comments, option lines (-r, -e, --hash, ...) and VCS/URL
    installs (git+..., https://...), which are valid but not parseable by
    packaging.requirements.Requirement."""
    from packaging.requirements import InvalidRequirement, Requirement

    findings = []
    for i, raw in enumerate(text.splitlines(), start=1):
        line = raw.strip()
        if not line or line.startswith("#") or line.startswith("-"):
            continue
        # Strip inline comments (" #" per pip's grammar).
        if " #" in line:
            line = line.split(" #", 1)[0].strip()
        if "://" in line or line.startswith("git+"):
            continue
        try:
            Requirement(line)
        except InvalidRequirement as exc:
            findings.append(
                _finding(path, i, 1, f"Invalid requirement specifier: {exc}")
            )
    return findings


def check_makefile(path, text):
    """Flag recipe lines indented with spaces instead of a tab — the classic
    'missing separator' Makefile syntax error. Conservative and stateful to
    keep false positives low: a line is treated as a recipe line only when it
    is indented AND the current context is inside a rule (i.e. following a
    target line, with no blank line having closed the recipe block).

    This is the one auto-fixable case here, so it emits a suggestion that
    replaces the leading spaces with a single tab."""
    findings = []
    in_rule = False
    in_define = False
    lines = text.splitlines()
    for i, raw in enumerate(lines, start=1):
        # A define ... endef block holds arbitrary text where any indentation
        # (tabs or spaces) is valid, so skip recipe-indentation checks inside
        # it. Otherwise a tab-indented line in the block would wrongly set
        # in_rule and produce false positives on later space-indented lines.
        if in_define:
            if re.match(r"\s*endef(\s|$)", raw):
                in_define = False
            continue
        if re.match(r"\s*define(\s|$)", raw):
            in_define = True
            in_rule = False
            continue
        if raw.strip() == "":
            in_rule = False
            continue
        if raw.startswith("\t"):
            # Already a proper (tab-indented) recipe line.
            in_rule = True
            continue
        if raw.startswith(" "):
            if in_rule:
                stripped = raw.lstrip(" ")
                findings.append(
                    _finding(
                        path,
                        i,
                        1,
                        "Recipe line is indented with spaces; GNU make "
                        "requires a tab (causes 'missing separator').",
                        suggestion="\t" + stripped,
                    )
                )
            # Non-recipe indented line (e.g. inside a define): leave in_rule.
            continue
        # A line starting at column 0 that isn't blank: does it open a rule?
        # A target line has an unescaped ':' and is not a variable assignment.
        without_comment = raw.split("#", 1)[0]
        is_assignment = any(
            op in without_comment for op in (":=", "::=", "?=", "+=")
        ) or (
            "=" in without_comment
            and ":" not in without_comment.split("=", 1)[0]
        )
        in_rule = (":" in without_comment) and not is_assignment
    return findings


def check_markdown(path, text):
    """Detect an unclosed fenced code block (``` or ~~~) — the one Markdown
    'syntax' error with real impact (it renders the rest of the page as code).
    Annotate-only: where the fence *should* have closed is ambiguous, so no
    one-click suggestion is offered."""
    findings = []
    fence_char = None
    fence_len = 0
    fence_line = 0
    for i, raw in enumerate(text.splitlines(), start=1):
        stripped = raw.lstrip(" ")
        indent = len(raw) - len(stripped)
        if indent > 3:  # 4+ spaces is an indented code block, not a fence.
            continue
        ch = stripped[:1]
        if ch not in ("`", "~"):
            continue
        run = len(stripped) - len(stripped.lstrip(ch))
        if run < 3:
            continue
        rest = stripped[run:]
        if fence_char is None:
            # Opening fence. An info string may follow (e.g. ```python).
            fence_char, fence_len, fence_line = ch, run, i
        elif ch == fence_char and run >= fence_len and rest.strip() == "":
            # Closing fence: same char, length >= opening, nothing trailing.
            fence_char, fence_len, fence_line = None, 0, 0
    if fence_char is not None:
        findings.append(
            _finding(
                path,
                fence_line,
                1,
                f"Unclosed code fence opened here (missing closing "
                f"'{fence_char * fence_len}').",
            )
        )
    return findings


def checker_for(path):
    """Return the checker function for a path, or None if unhandled."""
    base = os.path.basename(path)
    if base == "Makefile":
        return check_makefile
    if base == "requirements.txt":
        return check_requirements
    ext = os.path.splitext(path)[1].lower()
    return {
        ".yml": check_yaml,
        ".yaml": check_yaml,
        ".json": check_json,
        ".md": check_markdown,
        ".markdown": check_markdown,
    }.get(ext)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("files", nargs="*", help="paths to check")
    parser.add_argument(
        "--findings-out",
        default="syntax-findings.json",
        help="where to write the findings JSON",
    )
    args = parser.parse_args()

    all_findings = []
    for path in args.files:
        if not os.path.isfile(path):
            # File deleted in the PR (still shows up in the diff) — skip.
            continue
        checker = checker_for(path)
        if checker is None:
            continue
        try:
            with open(path, "r", encoding="utf-8") as handle:
                text = handle.read()
        except (OSError, UnicodeDecodeError) as exc:
            all_findings.append(_finding(path, 1, 1, f"Could not read file: {exc}"))
            continue
        all_findings.extend(checker(path, text))

    # Emit GitHub Actions annotations (inline on the Files-changed tab).
    for f in all_findings:
        print(
            f"::error file={_escape_property(f['path'])},"
            f"line={f['line']},col={f['col']}::{_escape_data(f['message'])}"
        )

    with open(args.findings_out, "w", encoding="utf-8") as handle:
        json.dump(all_findings, handle, indent=2)

    if all_findings:
        print(
            f"\nFound {len(all_findings)} syntax problem(s) across "
            f"{len({f['path'] for f in all_findings})} file(s).",
            file=sys.stderr,
        )
    else:
        print("No syntax problems found in changed files.", file=sys.stderr)

    # Always exit 0 — the workflow's enforce step decides pass/fail so that
    # annotations print and suggestions post first.
    return 0


if __name__ == "__main__":
    sys.exit(main())
