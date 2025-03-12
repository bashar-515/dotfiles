#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if [ ! -e "$HOME_DIR" ]; then
  echo "$HOME_DIR does not exist." >&2
  exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS_DIR="$DOTFILES_DIR/$(uname)"
OS_INSTALL_SCRIPT="$OS_DIR/install.sh"

if [[ ! -d "$OS_DIR" ]]; then
    echo "$OS_DIR does not exist."
    exit 1
fi

if [[ ! -e "$OS_INSTALL_SCRIPT" ]]; then
    echo "$OS_INSTALL_SCRIPT does not exist."
    exit 1
fi

bash "$OS_INSTALL_SCRIPT" "$HOME_DIR"
