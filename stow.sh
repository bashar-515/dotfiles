#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMON_DIR="$DOTFILES_DIR/common"
OS_DIR="$DOTFILES_DIR/$(uname)"

stow_dotfiles() {
    # absolute path to either Linux, Darwin, or common directories
    local program_dir=$1

    # names of directories in `program_dir`
    local dotfiles=$(ls -d "$program_dir"/*/ | xargs -n1 basename)

    for dotfile in $dotfiles; do
        for entry in "$program_dir/$dotfile"/{*,.[!.]*}; do
            local path=$HOME/$(basename "$entry")

            if [[ -e "$path" ]]; then
                mv "$path" "${path}.$(date -u +%Y%m%d%H%M%S).bak"
            fi
        done
    done


    for dotfile in $dotfiles; do
        # e.g., stow -d ~/.files/common -t ~/. nvim
        stow -d "$program_dir" -t "/home/bashar-dot" "$dotfile"
    done
}

stow_dotfiles "$COMMON_DIR"
stow_dotfiles "$OS_DIR"
