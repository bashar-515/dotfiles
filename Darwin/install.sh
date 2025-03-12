#!/bin/bash

set -e

if ! xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools are not installed."
fi

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing it now."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $SCRIPT_DIR

brew bundle
