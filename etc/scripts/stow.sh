#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if [ ! -e "$HOME_DIR" ]; then
    echo "$HOME_DIR does not exist." >&2
    exit 1
fi

if ! stow --version >/dev/null 2>&1; then
    echo "Stow is not installed."
    exit 1
fi
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(realpath "$SCRIPT_DIR/../../")"
COMMON_DIR="$DOTFILES_DIR/common"
OS_DIR="$DOTFILES_DIR/$(uname)"

stow_dotfiles() {
    # absolute path to either Linux, Darwin, or common directories
    local program_dir=$1

    # names of directories in `program_dir`
    local dotfiles=$(ls -d "$program_dir"/*/ | xargs -n1 basename)

    # TODO: deal with conflicts
    # for dotfile in $dotfiles; do
    #     for entry in "$program_dir/$dotfile"/{*,.[!.]*}; do
    #         local path=$HOME_DIR/$(basename "$entry")
    #
    #         if [[ -e "$path" ]]; then
    #             mv "$path" "${path}.$(date -u +%Y%m%d%H%M%S).bak"
    #         fi
    #     done
    # done

    for dotfile in $dotfiles; do
        # e.g., stow -d ~/.files/common -t ~/. nvim
        stow -d "$program_dir" -t "$HOME_DIR" "$dotfile"
    done
}

if [ ! -e "$COMMON_DIR" ]; then
    echo "$COMMON_DIR does not exist." >&2
    exit 1
fi

if [ ! -e "$OS_DIR" ]; then
    becho "$OS_DIR does not exist." >&2
    exit 1
fi

stow_dotfiles "$COMMON_DIR"
stow_dotfiles "$OS_DIR"
