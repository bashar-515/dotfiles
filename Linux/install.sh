#!/bin/bash

set -e

if ! apt-get --version > /dev/null 2>&1; then
    echo "Missing package manager."
    exit 1
fi

apt-get update

apt-get install -y \
    build-essential \
    git \
    curl \
    stow \
    tmux \
    neovim \
    ripgrep \
    wget \
    fzf \
    bat \
    git-delta \
    eza \
    zoxide

if ! command -v curl >/dev/null 2>&1; then
    echo "Curl is not installed."
    exit 1
fi

GIT_VERSION=$(git --version | awk '{print $3}')
if [[ -z "$GIT_VERSION" ]]; then
    echo "Unable to determine git version."
    exit 1
fi

TAG="v$GIT_VERSION"
GIT_COMPLETION_FILE="git-completion.bash"
FILE_PATH="contrib/completion/$GIT_COMPLETION_FILE"
URL="https://raw.githubusercontent.com/git/git/refs/tags/${TAG}/${FILE_PATH}"
DEST_FILE=".$GIT_COMPLETION_FILE"

curl -sS https://starship.rs/install.sh | sh -s -- -y
curl -o "${DEST_FILE}" "${URL}" 
