#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: fix-geo-links.sh
#
# Description:
#   Each built page includes a <link rel="alternate" type="text/markdown">
#   tag pointing AI bots/crawlers (GEO — Generative Engine Optimization) at
#   the raw Markdown source for that page, e.g.:
#     <link rel="alternate" type="text/markdown"
#           href="https://github.com/google/transit/raw/main/docs/en/...md">
#   This URL is built from each config/<lang>/mkdocs.yml's `repo_url`, which
#   is still set to the old google/transit repo (kept for the "Edit this
#   page" link and GitHub icon). Since the actual docs/<lang>/ source now
#   lives in MobilityData/gtfs.org, the generated raw-content URL 404s. This
#   script rewrites that URL (only) to point at MobilityData/gtfs.org across
#   all built HTML files, so bots can actually fetch the Markdown.
#
# What it does:
#   - Takes the built site's base directory as an argument.
#   - Finds all .html files under that directory (recursively, all languages).
#   - Replaces every occurrence of the old raw-content base URL
#     (https://github.com/google/transit/raw/main/docs) with the new one
#     (https://github.com/MobilityData/gtfs.org/raw/main/docs).
#
# Works on both the Ubuntu server (GNU sed) and macOS (BSD sed), which
# require different `-i` invocations — see the OS check below.
#
# Usage:
#   ./fix-geo-links.sh /path/to/built/site
# -----------------------------------------------------------------------------

# Exit if no argument provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/base/dir"
  exit 1
fi

# URLs
OLD_BASE="https://github.com/google/transit/raw/main/docs"
NEW_BASE="https://github.com/MobilityData/gtfs.org/raw/main/docs"

# Get base directory from argument
BASE_DIR="${1%/}"

# GNU sed (Linux) accepts `-i` directly; BSD sed (macOS) requires an explicit
# (empty) backup-extension argument right after -i.
if [[ "$OSTYPE" == "darwin"* ]]; then
  SED_INPLACE=(-i '')
else
  SED_INPLACE=(-i)
fi

# Escape regex metacharacters (., in this case) so OLD_BASE is matched
# literally rather than as a sed pattern.
OLD_BASE_ESCAPED=$(printf '%s' "$OLD_BASE" | sed -e 's/[]\/$*.^[]/\\&/g')

# Replace all instances of OLD_BASE with NEW_BASE in BASE_DIR
find "$BASE_DIR" -name "*.html" -type f -exec sed "${SED_INPLACE[@]}" "s|${OLD_BASE_ESCAPED}|${NEW_BASE}|g" {} +