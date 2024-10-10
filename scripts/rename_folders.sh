#!/bin/bash

# Find all directories named "Answers" and rename them to "answers"
find . -type d -name "Answers" -execdir mv {} answers \;

echo "Renaming completed."
