#!/usr/bin/env bash

# Define paths
readonly XKB_DIR="$HOME/.xkb"
readonly KEYMAP_FILE="$XKB_DIR/keymap"
xkbcomp -I"$XKB_DIR" "$KEYMAP_FILE" $DISPLAY &>/dev/null
