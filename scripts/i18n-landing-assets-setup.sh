#!/bin/bash

# Define the source directory
SOURCE_DIR="overrides/assets/landing"
ALL_LANGUAGES=("fr" "es" "ja" "de" "id" "ko" "pt" "ru" "zh" "zh-TW")
LANGUAGES_TO_COPY_TO=("fr" "es" "ja")
RESOURCES_DIR="docs/en/resources"
FARES_V2_DIR="docs/en/documentation/schedule/examples/fares/"

echo "" && echo ""
echo "Copying the overrides..."
# Loop through each language and copy the source directory
for lang in "${ALL_LANGUAGES[@]}"; do
  DEST_DIR="overrides/$lang/assets"
  
  # Create the destination directory if it doesn't exist
  mkdir -p "$DEST_DIR"
  
  # Copy the source directory to the destination directory
  cp -r "$SOURCE_DIR" "$DEST_DIR"
  
  echo "Folder copied successfully to $DEST_DIR"
done

# Copy Resources & /documentation/schedule/examples/fares/intro/ from English to French, Spanish, Japanese.
# Once translated this step needs to be removed.

echo "" && echo ""
echo "Copying the Resources and Fares v2 examples sections..."
# Loop through the languages that are translated and copy the english files.
for lang in "${LANGUAGES_TO_COPY_TO[@]}"; do
  DEST_DIR_RESOURCES="docs/$lang"
  DEST_DIR_FARES_V2="docs/$lang/documentation/schedule/examples/fares/"
  
  # Copy the source directory to the destination directory
  cp -r "$RESOURCES_DIR" "$DEST_DIR_RESOURCES"
  cp -r "$FARES_V2_DIR" "$DEST_DIR_FARES_V2"
  
  echo "Folder copied successfully to $DEST_DIR_RESOURCES & $DEST_DIR_FARES_V2"
done
echo "" && echo ""