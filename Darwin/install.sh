#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if xcode-select -p &> /dev/null; then
    echo "Xcode Command Line Tools are installed."
fi

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing it now."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd SCRIPT_DIR

brew bundle

# set up Git completions
GIT_VERSION=$(git --version | awk '{print $3}')
if [[ -z "$GIT_VERSION" ]]; then
    echo "Unable to determine git version."
    exit 1
fi
TAG="v$GIT_VERSION"
GIT_COMPLETION_FILE="git-completion.zsh"
FILE_PATH="contrib/completion/$GIT_COMPLETION_FILE"
URL="https://raw.githubusercontent.com/git/git/refs/tags/${TAG}/${FILE_PATH}"
DEST_FILE="$HOME_DIR/.$GIT_COMPLETION_FILE"
curl -o "${DEST_FILE}" "${URL}"
