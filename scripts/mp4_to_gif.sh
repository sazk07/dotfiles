#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    printf 'Usage: %s INPUT.mp4 OUTPUT.gif\n' "$0"
    exit 1
fi

input="$1"
output="$2"
palette="palette.png"

# Generate palette
if ! ffmpeg -i "$input" \
    -vf "fps=10,scale=320:-1:flags=lanczos,palettegen" \
    "$palette"; then
    printf 'Error: failed to generate palette.\n' >&2
    exit 1
fi

# Generate GIF
if ! ffmpeg -i "$input" -i "$palette" \
    -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" \
    "$output"; then
    printf 'Error: failed to generate GIF.\n' >&2
    rm -f "$palette"
    exit 1
fi

# Cleanup only after successful GIF creation
rm -f "$palette" "$input"
