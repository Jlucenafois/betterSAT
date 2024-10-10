#!/bin/bash

# Check if the directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Assign the directory from the first argument
TARGET_DIR="$1"

# Find and remove files containing 'merged_', 'student_version', or 'wrong' in their name
find "$TARGET_DIR" -type f \( \
  -name "*merged_*" -o \
  -name "*student_*" -o \
  -name "*get_answers*" -o \
  -name "*print_ids*" -o \
  -name "*select**" -o \
  -name "*wrong*" \
\) -exec rm -v {} +

echo "Files with 'merged_', 'student_version', or 'wrong' in their names have been removed from $TARGET_DIR."
