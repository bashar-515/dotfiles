#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

COMMON_DIR="$DOTFILES_DIR/common"
OS_DIR="$DOTFILES_DIR/$(uname)"
OS_SETUP_SCRIPT="$OS_DIR/setup.sh"

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
        stow -d "$program_dir" -t "$HOME" "$dotfile"
    done
}

if ! command -v stow &> /dev/null; then
    echo "GNU Stow is not installed."
    exit 1
fi

if [[ ! -d "$COMMON_DIR" ]]; then
    echo "$COMMON_DIR does not exist"
    exit 1
fi

if [[ ! -d "$OS_DIR" ]]; then
    echo "$OS_DIR does not exist"
    exit 1
fi

if [[ ! -e "$OS_SETUP_SCRIPT" ]]; then
    echo "$OS_SETUP_SCRIPT does not exist"
    exit 1
fi

stow_dotfiles "$COMMON_DIR"
stow_dotfiles "$OS_DIR"

bash "$OS_SETUP_SCRIPT"
