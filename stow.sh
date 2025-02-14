#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OS="$(uname)"

COMMON_DIR="$DOTFILES_DIR/common"
OS_DIR="$DOTFILES_DIR/$OS"

DOTFILES_COMMON=$(ls -d "$COMMON_DIR"/*/ | xargs -n1 basename)
DOTFILES_OS=$(ls -d "$OS_DIR"/*/ | xargs -n1 basename)


stow_dotfiles() {
    local dir=$1
    local dotfiles=$2

    for dotfile in $dotfiles; do
        echo $dir
        echo $HOME
        echo $dotfile
        # stow -d "$dir" -t "$HOME" "$dotfile"
    done
}

if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed."
    exit 1
fi

if [[ -d "$COMMON_DIR" ]]; then
    stow_dotfiles "$COMMON_DIR" "$DOTFILES_COMMON"
fi

if [[ -d "$OS_DIR" ]]; then
    stow_dotfiles "$OS_DIR" "$DOTFILES_OS"
fi
