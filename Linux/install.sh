#!/bin/bash

set -e

HOME_DIR=$(realpath "$1")

if [ ! -e "$HOME_DIR" ]; then
    echo "$HOME_DIR does not exist." >&2
    exit 1
fi

if ! apt-get --version >/dev/null 2>&1; then
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
    bat \
    git-delta \
    eza \
    zoxide \
    unzip \
    nodejs \
    luarocks

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME_DIR/.fzf &&
    $HOME_DIR/.fzf/install --key-bindings --completion --no-update-rc --no-fish --no-zsh
mv ~/.fzf.bash $HOME_DIR/

# install prerequisites for building Neovim from source
apt-get install -y \
    ninja-build \
    gettext \
    cmake \
    file

# install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# build Neovim from source
git clone https://github.com/neovim/neovim $HOME_DIR/neovim
cd $HOME_DIR/neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
cd build && cpack -G DEB && dpkg -i nvim-linux-$(uname -m | sed 's/aarch64/arm64/').deb

# install nvm
PROFILE=$HOME_DIR/.bashrc curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
