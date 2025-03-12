#!/bin/bash

set -e

if ! apt-get --version > /dev/null 2>&1; then
    echo "Missing package manager."
    exit 1
fi

apt-get update

# install my preferred tools and required packages
apt-get install -y \
    build-essential \
    git \
    curl \
    stow \
    tmux \
    ripgrep \
    wget \
    bash-completion \
    fzf \
    bat \
    git-delta \
    eza \
    zoxide \
    unzip

# install prerequisites for building Neovim from source
apt-get install -y \
  ninja-build \
  gettext \
  cmake \
  file

# set up Git completions
# GIT_VERSION=$(git --version | awk '{print $3}')
# if [[ -z "$GIT_VERSION" ]]; then
#     echo "Unable to determine git version."
#     exit 1
# fi
# TAG="v$GIT_VERSION"
# GIT_COMPLETION_FILE="git-completion.bash"
# FILE_PATH="contrib/completion/$GIT_COMPLETION_FILE"
# URL="https://raw.githubusercontent.com/git/git/refs/tags/${TAG}/${FILE_PATH}"
# DEST_FILE=".$GIT_COMPLETION_FILE" # NOTE: here, we dont' specify '$HOME'
# curl -o "${DEST_FILE}" "${URL}" 

# install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# build Neovim from source
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && dpkg -i nvim-linux-$(uname -m).deb
