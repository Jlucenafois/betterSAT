#!/bin/bash

# Define the directory where the files are located (current directory by default)
SOURCE_DIR="."
# Define the target directory
TARGET_DIR="Answers"

# Create the target directory if it does not exist
mkdir -p "$TARGET_DIR"

# Move files with "Answer" anywhere in their name
for file in "$SOURCE_DIR"/*; do
    # Extract filename without path
    filename=$(basename -- "$file")
    # Check if the filename contains "Answer"
    if [ -f "$file" ] && [[ "$filename" == *Answer* ]]; then
        mv "$file" "$TARGET_DIR/"
        echo "Moved: $file to $TARGET_DIR/"
    fi
done
