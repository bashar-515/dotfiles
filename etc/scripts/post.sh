#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if [ ! -e "$HOME_DIR" ]; then
    echo "$HOME_DIR does not exist." >&2
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(realpath "$SCRIPT_DIR/../../")"
OS_DIR="$DOTFILES_DIR/$(uname)"
OS_POST_SCRIPT="$OS_DIR/post.sh"

if [[ ! -e "$OS_POST_SCRIPT" ]]; then
    echo "$OS_POST_SCRIPT does not exist."
else
    bash "$OS_POST_SCRIPT" "$HOME_DIR"
fi
