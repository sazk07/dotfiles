#!/usr/bin/env bash

# Define paths
readonly XKB_DIR="$HOME/.config/xkb"
readonly KEYMAP_FILE="$XKB_DIR/keymap"
xkbcomp -I"$XKB_DIR" "$KEYMAP_FILE" "$DISPLAY" &>/dev/null
