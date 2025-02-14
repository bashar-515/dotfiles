#!/bin/bash

rm -f ~/.bashrc

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OS="$(uname)"

COMMON_DIR="$DOTFILES_DIR/common"
OS_DIR="$DOTFILES_DIR/$OS"

DOTFILES_COMMON=$(ls -d "$COMMON_DIR"/*/ | xargs -n1 basename)
DOTFILES_OS=$(ls -d "$OS_DIR"/*/ | xargs -n1 basename)

stow_dotfiles() {
    for dotfile in $dotfiles; do
        # e.g., stow -d ~/.files/common -t ~/. nvim
        stow -d "$1" -t "$HOME" "$2"
    done
}

if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed."
    exit 1
fi

if [[ -d "$COMMON_DIR" ]]; then
    echo "$COMMON_DIR does not exist"
    exit 1
    stow_dotfiles "$COMMON_DIR" "$DOTFILES_COMMON"
fi

if [[ -d "$OS_DIR" ]]; then
    echo "$OS_DIR does not exist"
    exit 1
    stow_dotfiles "$OS_DIR" "$DOTFILES_OS"
fi
