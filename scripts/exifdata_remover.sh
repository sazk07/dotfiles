#!/usr/bin/env bash

# Get a list of all entries in the directory
files=(*)

for file in "${files[@]}"; do
  # Skip if not a regular file
  [[ -f "$file" ]] || continue

  # Skip .sh files
  [[ "$file" == *.sh ]] && continue

  # use exiftool to remove exif data
  exiftool -overwrite_original -all= "$file"

done
