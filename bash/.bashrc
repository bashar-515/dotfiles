eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init bash)"

eval "$(starship init bash)"

fastfetch

. ~/.aliases
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export PATH=$HOME/Developer/flutter/bin:$PATH

export PATH="$PATH":"$HOME/.pub-cache/bin"

export PRETTIERD_DEFAULT_CONFIG=~/.prettierrc
