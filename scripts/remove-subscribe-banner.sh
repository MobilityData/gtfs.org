#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: remove-subscribe-banner.sh
#
# Description:
#   This script searches through all .html files within a specified base
#   directory (excluding files under the 'blog' subdirectory), and inserts
#   a specific CSS style snippet immediately after the <head> tag. The
#   inserted style hides elements with the attribute data-md-component="announce".
#
#   This is typically used to suppress announcement banners or UI components
#   in generated documentation or web files.
#
# What it does:
#   - Defines a base directory to operate within.
#   - Searches for all .html files under that directory, excluding those in /blog/.
#   - Checks if each HTML file contains a <head> tag.
#   - Inserts a CSS <style> element right after the <head> tag to hide
#     [data-md-component="announce"] elements using display: none !important.
#
# Usage:
#   ./remove-subscribe-banner.sh /path/to/base/dir
# -----------------------------------------------------------------------------

# Exit if no argument provided
if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/base/dir"
  exit 1
fi

# Get base directory from argument
BASE_DIR="${1%/}"

# The HTML snippet to insert
INSERT='      <style>[data-md-component="announce"] {display: none !important;}</style>'

# Find .html files excluding those in the blog directory
find "$BASE_DIR" -type f -name '*.html' ! -path "$BASE_DIR/blog/*" | while read -r file; do
  # Check if file contains <head>
  if grep -q "<head>" "$file"; then
    # Use sed to insert the style line after <head>
    sed -i "/<head>/a\\
$INSERT
" "$file"
  fi
done