#!/bin/bash

# Define the source directory
SOURCE_DIR="overrides/assets/landing"

LANGUAGES=("fr" "es" "de" "id" "ja" "ko" "pt" "ru" "zh" "zh-TW")

# Loop through each language and copy the source directory
for lang in "${LANGUAGES[@]}"; do
  DEST_DIR="overrides/$lang/assets"
  
  # Create the destination directory if it doesn't exist
  mkdir -p "$DEST_DIR"
  
  # Copy the source directory to the destination directory
  cp -r "$SOURCE_DIR" "$DEST_DIR"
  
  echo "Folder copied successfully to $DEST_DIR"
done