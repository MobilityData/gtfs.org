#!/usr/bin/env python3
"""
post-review.py — post syntax-check findings as one inline PR review.

Reads the findings JSON produced by check-syntax.py and posts a single review
(event=COMMENT) whose comments sit on the offending lines, embedding a
``suggestion`` block when the finding carries an unambiguous fix.

Only runs on same-repo PRs (the workflow gates this), because PRs from forks
get a read-only GITHUB_TOKEN that cannot create reviews. Those PRs still get
the inline annotations and the failing check.

GitHub rejects an entire review if any comment targets a line that is not part
of the PR diff, so findings are filtered to lines actually added/modified by
the PR (parsed from `git diff`). Findings on unchanged lines of a changed file
fall back to the annotation that check-syntax.py already emitted.

Configuration comes from the environment:
  GH_TOKEN   - token with pull-requests: write
  REPO       - "owner/name"
  PR_NUMBER  - pull request number
  BASE_SHA   - PR base commit
  HEAD_SHA   - PR head commit (used as the review commit_id)
  FINDINGS   - path to findings JSON (default: syntax-findings.json)
"""

import json
import os
import re
import subprocess
import sys
import urllib.error
import urllib.request

HUNK_RE = re.compile(r"^@@ -\d+(?:,\d+)? \+(\d+)(?:,(\d+))? @@")


def added_lines(base_sha, head_sha, path):
    """Return the set of new-file line numbers added/modified for `path` in
    the PR diff, parsed from unified diff hunk headers."""
    result = subprocess.run(
        ["git", "diff", "--unified=0", f"{base_sha}...{head_sha}", "--", path],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        return set()

    lines = set()
    new_line = 0
    in_hunk = False
    for row in result.stdout.splitlines():
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
            # "\ No newline at end of file" marker — not a real line, and must
            # not advance the new-side counter or later hunks desync.
            continue
        if row.startswith("+"):
            lines.add(new_line)
            new_line += 1
        elif row.startswith("-"):
            # Deletion — does not exist on the new side; do not advance.
            continue
        else:
            # Context line (rare with --unified=0) advances the new counter.
            new_line += 1
    return lines


def comment_body(finding):
    """Render a review-comment body, with a suggestion block when available."""
    message = finding["message"]
    suggestion = finding.get("suggestion")
    if suggestion is not None:
        return (
            f"{message}\n\n"
            f"Suggested fix:\n\n"
            f"```suggestion\n{suggestion}\n```"
        )
    return message


def post_review(repo, pr_number, token, commit_id, comments):
    """POST a single review with the given inline comments."""
    payload = {
        "commit_id": commit_id,
        "event": "COMMENT",
        "body": (
            "Automated syntax check found issues in changed files. "
            "See the inline comments below."
        ),
        "comments": comments,
    }
    request = urllib.request.Request(
        f"https://api.github.com/repos/{repo}/pulls/{pr_number}/reviews",
        data=json.dumps(payload).encode("utf-8"),
        method="POST",
        headers={
            "Authorization": f"Bearer {token}",
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
            "Content-Type": "application/json",
        },
    )
    try:
        with urllib.request.urlopen(request) as response:
            print(f"Posted review ({response.status}) with {len(comments)} comment(s).")
    except urllib.error.HTTPError as exc:
        # Never fail the workflow on a review-posting problem — annotations
        # and the enforce step already communicate the failure.
        detail = exc.read().decode("utf-8", "replace")
        print(
            f"Warning: could not post review ({exc.code}): {detail}",
            file=sys.stderr,
        )


def main():
    findings_path = os.environ.get("FINDINGS", "syntax-findings.json")
    with open(findings_path, "r", encoding="utf-8") as handle:
        findings = json.load(handle)
    if not findings:
        print("No findings; nothing to post.")
        return 0

    repo = os.environ["REPO"]
    pr_number = os.environ["PR_NUMBER"]
    token = os.environ["GH_TOKEN"]
    base_sha = os.environ["BASE_SHA"]
    head_sha = os.environ["HEAD_SHA"]

    # Cache the added-line set per file.
    added_by_file = {}
    comments = []
    for f in findings:
        path = f["path"]
        if path not in added_by_file:
            added_by_file[path] = added_lines(base_sha, head_sha, path)
        if f["line"] not in added_by_file[path]:
            # Not on a changed line — annotation-only, skip inline comment.
            continue
        comments.append(
            {
                "path": path,
                "line": f["line"],
                "side": "RIGHT",
                "body": comment_body(f),
            }
        )

    if not comments:
        print(
            "All findings are on unchanged lines; relying on annotations only."
        )
        return 0

    post_review(repo, pr_number, token, head_sha, comments)
    return 0


if __name__ == "__main__":
    sys.exit(main())
