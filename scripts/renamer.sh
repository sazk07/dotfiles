#!/usr/bin/env bash

# Get a list of all entries in the directory
files=(*)

for file in "${files[@]}"; do
  # Skip if not a regular file
  [[ -f "$file" ]] || continue

  # Skip .sh files
  [[ "$file" == *.sh ]] && continue

  # Generate a Unix timestamp
  timestamp=$(date +%s)

  # Get the file extension (if any)
  extension="${file##*.}"
  if [[ "$file" == *.* && "$extension" != "$file" ]]; then
    new_name="${timestamp}.${extension}"
  else
    new_name="${timestamp}"
  fi

  # Copy and rename
  cp -- "$file" "$new_name"

  # Check if the copy succeeded, then remove original
  if [[ -f "$new_name" ]]; then
    rm -- "$file"
  else
    echo "Failed to copy $file"
  fi

  # Sleep to avoid duplicate timestamps
  sleep 1
done
