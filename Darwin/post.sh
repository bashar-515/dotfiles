#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if [ ! -e "$HOME_DIR" ]; then
    echo "$HOME_DIR does not exist." >&2
    exit 1
fi

# install nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash'
