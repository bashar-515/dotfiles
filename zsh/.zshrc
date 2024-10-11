eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

fastfetch

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

. ~/.aliases
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

export PATH=$HOME/Developer/flutter/bin:$PATH
