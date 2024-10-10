#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Assign the directory from the first argument
TARGET_DIR="$1"

# Find all PDF files excluding directories named 'answers'
find "$TARGET_DIR" -type f -name "*.pdf" ! -path "*/answers/*" | while read -r file; do
  # Get the parent directory of the file
  parent_dir=$(dirname "$file")
  
  # Define the target 'blanks' subfolder in the parent directory
  blanks_dir="$parent_dir/blanks"
  
  # Create the 'blanks' directory if it doesn't exist
  if [ ! -d "$blanks_dir" ]; then
    mkdir -p "$blanks_dir"
    echo "Created directory: $blanks_dir"
  fi
  
  # Move the PDF file to the 'blanks' folder
  mv -v "$file" "$blanks_dir/"
done

echo "All PDF files have been moved to their closest 'blanks' subfolders."
