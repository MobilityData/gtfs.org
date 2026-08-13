#!/usr/bin/env python3
"""
check-underscores.py — flag underscores in URL-visible paths introduced by a PR.

Site URLs are built from file paths, and the server will not serve an
underscored path. The Nginx config for gtfs.org carries an unconditional
redirect:

    rewrite ^/(.*)_(.*)$ /$1-$2 permanent;

Any request whose path contains an underscore is 301'd to the hyphenated
equivalent, whether or not the underscored file exists. So a file added with an
underscore in its path is unreachable by construction: every request for it
arrives at the origin hyphenated, finds nothing, and 404s. (The rule rewrites
one underscore per pass, so a path with several underscores takes several 301
round-trips before it resolves.)

The convention dates back to Google advising the project to move the whole site
off underscores for search-ranking reasons; the redirect was the practical way
to do that at this site's size. This check exists so new content doesn't keep
adding paths that depend on the redirect — or, worse, paths the redirect makes
permanently unreachable.

This check enforces that on *new* content only:

  1. Link targets on lines the PR adds or modifies in Markdown files under
     docs/. Only the path portion of a scheme-less link is examined.
  2. Paths of files the PR adds (photos, scripts, stylesheets, new pages)
     under docs/ or overrides/.

Deliberately NOT flagged, because the redirect cannot affect them:

  - Anchor fragments (``](#stop_timestxt)``). A fragment never leaves the
    browser, so it never reaches the rewrite. These are GTFS file and field
    names, which the spec underscores and which cannot be renamed anyway.
  - Query strings. Nginx matches ``rewrite`` against the decoded URI and
    reattaches the query untouched, so underscores after '?' survive intact.
  - External URLs (``https://en.wikipedia.org/wiki/ISO_4217``, mailto:, ...).
    Another host serves those; gtfs.org's Nginx never sees them.
  - Everything on lines the PR did not touch.

There is no grandfathering: linking to an existing underscored page from a new
line is flagged too, since the fix is to rename the page.

Output mirrors check-syntax.py: GitHub Actions error annotations plus a
findings JSON for the review-posting and enforce steps. Findings carry no
``suggestion`` — swapping ``_`` for ``-`` would point the link at a page that
does not exist yet, so the repair is a human decision (rename the target, or
link somewhere else).

This script always exits 0; the workflow's enforce step decides pass/fail.
"""

import argparse
import json
import os
import re
import subprocess
import sys

# Only paths that end up in a public URL are checked. scripts/ and .github/
# never reach the site (and already use underscores throughout), config/ holds
# build inputs rather than served files.
MARKDOWN_PREFIXES = ("docs/",)
ADDED_FILE_PREFIXES = ("docs/", "overrides/")

HUNK_RE = re.compile(r"^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@")

# Inline/reference Markdown links and images: ](target), ](<target>), and
# [label]: target. The target stops at whitespace so an optional "title" is
# excluded, and at ')' / '>' for the bracketed forms.
LINK_RES = (
    re.compile(r"\]\(\s*<([^>]*)>"),
    re.compile(r"\]\(\s*([^)\s]+)"),
    re.compile(r"^\s{0,3}\[[^\]]+\]:\s*<?([^\s>]+)"),
    # Raw HTML embedded in Markdown (<img src=...>, <a href=...>).
    re.compile(r"(?:href|src)\s*=\s*[\"']([^\"']+)[\"']", re.IGNORECASE),
)

# A leading scheme (https:, mailto:, tel:, data:) or a protocol-relative URL
# means the path belongs to another host.
EXTERNAL_RE = re.compile(r"^(?:[A-Za-z][A-Za-z0-9+.-]*:|//)")


def _finding(path, line, col, message):
    """Build one finding dict, shaped for post-review.py."""
    return {
        "path": path,
        "line": max(1, int(line)),
        "col": max(1, int(col)),
        "message": message,
        "suggestion": None,
    }


def _escape_data(value):
    """Escape a workflow-command *message*. GitHub decodes these sequences, so
    untrusted text (a link target written by the PR author) must be escaped or
    it could inject additional ::commands. Escape % first so the %0A/%0D we
    introduce aren't themselves re-escaped."""
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


def _git(args):
    """Run a git command, returning stdout ('' on failure)."""
    result = subprocess.run(
        ["git", *args], capture_output=True, text=True
    )
    if result.returncode != 0:
        print(
            f"Warning: git {' '.join(args)} failed: {result.stderr.strip()}",
            file=sys.stderr,
        )
        return ""
    return result.stdout


def changed_markdown_files(base_sha, head_sha):
    """Markdown files added/copied/modified/renamed by the PR, under the
    checked prefixes. Deletions are excluded — nothing to lint."""
    output = _git(
        [
            "diff",
            "--name-only",
            "--diff-filter=ACMR",
            f"{base_sha}...{head_sha}",
        ]
    )
    return [
        path
        for path in output.splitlines()
        if path.startswith(MARKDOWN_PREFIXES)
        and os.path.splitext(path)[1].lower() in (".md", ".markdown")
    ]


def added_files(base_sha, head_sha):
    """Files the PR *adds* (diff-filter=A), under the checked prefixes.

    Modified files are out of scope here: their path already existed, so an
    underscore in it is pre-existing rather than newly introduced."""
    output = _git(
        [
            "diff",
            "--name-only",
            "--diff-filter=A",
            f"{base_sha}...{head_sha}",
        ]
    )
    return [
        path for path in output.splitlines()
        if path.startswith(ADDED_FILE_PREFIXES)
    ]


def added_lines(base_sha, head_sha, path):
    """Yield (line_number, content) for every line the PR adds to `path`,
    numbered against the new side of the diff.

    Parsed from unified diff hunk headers rather than read from the working
    tree, so untouched lines of a modified file are never inspected."""
    output = _git(
        ["diff", "--unified=0", f"{base_sha}...{head_sha}", "--", path]
    )

    new_line = 0
    in_hunk = False
    for row in output.splitlines():
        header = HUNK_RE.match(row)
        if header:
            new_line = int(header.group(1))
            in_hunk = True
            continue
        if not in_hunk:
            # Pre-hunk header region ("diff --git", "index", "---", "+++").
            # Skipping here avoids mistaking the "+++ b/path" header for an
            # added line, while still counting real added lines whose content
            # begins with "+++" (those only appear after the first hunk).
            continue
        if row.startswith("\\"):
            # "\ No newline at end of file" — not a real line, and must not
            # advance the new-side counter or later hunks desync.
            continue
        if row.startswith("+"):
            yield new_line, row[1:]
            new_line += 1
        elif row.startswith("-"):
            # Deletion — does not exist on the new side; do not advance.
            continue
        else:
            # Context line (rare with --unified=0) advances the new counter.
            new_line += 1


def link_targets(line):
    """Yield (target, column) for every link-like target in a line.

    Column is 1-based and points at the target itself, so the annotation lands
    on the offending path rather than the start of the line."""
    for pattern in LINK_RES:
        for match in pattern.finditer(line):
            yield match.group(1), match.start(1) + 1


def offending_path(target):
    """Return the path portion of `target` if it violates the convention, else
    None.

    Strips the fragment and query first: an underscore after '#' or '?' is not
    part of the URL path (``#stop_timestxt`` is a GTFS field name, not ours to
    rename)."""
    path = target.split("#", 1)[0].split("?", 1)[0].strip()
    if not path:
        return None  # Pure fragment or query — no path to check.
    if EXTERNAL_RE.match(path):
        return None  # Another host's URL.
    if "_" not in path:
        return None
    return path


def check_markdown_links(base_sha, head_sha):
    """Flag underscored internal link paths on lines the PR touches."""
    findings = []
    for path in changed_markdown_files(base_sha, head_sha):
        for number, content in added_lines(base_sha, head_sha, path):
            for target, col in link_targets(content):
                bad = offending_path(target)
                if bad is None:
                    continue
                findings.append(
                    _finding(
                        path,
                        number,
                        col,
                        f"Link path '{bad}' contains an underscore. The site's "
                        f"Nginx config redirects any underscored URL to its "
                        f"hyphenated form (rewrite ^/(.*)_(.*)$ /$1-$2 "
                        f"permanent), so this link 301s to '{bad.replace('_', '-')}' "
                        f"— which 404s unless a hyphenated target exists there. "
                        f"Link directly to the hyphenated path. Underscores "
                        f"after '#' are fine: fragments never reach the server.",
                    )
                )
    return findings


def check_added_files(base_sha, head_sha):
    """Flag underscores in the paths of files the PR adds."""
    findings = []
    for path in added_files(base_sha, head_sha):
        if "_" not in path:
            continue
        findings.append(
            _finding(
                path,
                1,
                1,
                f"New file path '{path}' contains an underscore, so this file "
                f"can never be served. The site's Nginx config redirects every "
                f"underscored URL to its hyphenated form (rewrite "
                f"^/(.*)_(.*)$ /$1-$2 permanent) whether or not the "
                f"underscored file exists — so every request for this file "
                f"arrives at the origin hyphenated, finds nothing, and 404s. "
                f"Rename it using hyphens before merging.",
            )
        )
    return findings


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--base", required=True, help="PR base SHA")
    parser.add_argument("--head", required=True, help="PR head SHA")
    parser.add_argument(
        "--findings-out",
        default="underscore-findings.json",
        help="where to write the findings JSON",
    )
    args = parser.parse_args()

    findings = check_markdown_links(args.base, args.head)
    findings += check_added_files(args.base, args.head)

    # Emit GitHub Actions annotations (inline on the Files-changed tab, and
    # available to fork PRs, which cannot receive API-posted reviews).
    for f in findings:
        print(
            f"::error file={_escape_property(f['path'])},"
            f"line={f['line']},col={f['col']}::{_escape_data(f['message'])}"
        )

    with open(args.findings_out, "w", encoding="utf-8") as handle:
        json.dump(findings, handle, indent=2)

    if findings:
        print(
            f"\nFound {len(findings)} underscored path(s) across "
            f"{len({f['path'] for f in findings})} file(s).",
            file=sys.stderr,
        )
    else:
        print("No underscored paths introduced by this PR.", file=sys.stderr)

    # Always exit 0 — the workflow's enforce step decides pass/fail so that
    # annotations print and review comments post first.
    return 0


if __name__ == "__main__":
    sys.exit(main())
