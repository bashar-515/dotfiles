#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DOTFILES=$(ls -d */ | sed 's#/##')

stow_dotfiles() {
    for dotfile in $DOTFILES; do
        stow -d "$DOTFILES_DIR" -t "$HOME" "$dotfile"
    done
}

if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed."
    exit 1
fi

stow_dotfiles
