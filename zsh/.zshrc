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

export PATH="$PATH":"$HOME/.pub-cache/bin"

# FLUTTER zsh-completion

#
# Installation:
#
# Via shell config file  ~/.bashrc  (or ~/.zshrc)
#
#   Append the contents to config file
#   'source' the file in the config file
#
# You may also have a directory on your system that is configured
#    for completion files, such as:
#
#    /usr/local/etc/bash_completion.d/

###-begin-flutter-completion-###

if type complete &>/dev/null; then
  __flutter_completion() {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           flutter completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F __flutter_completion flutter
elif type compdef &>/dev/null; then
  __flutter_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 flutter completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef __flutter_completion flutter
elif type compctl &>/dev/null; then
  __flutter_completion() {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       flutter completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K __flutter_completion flutter
fi

###-end-flutter-completion-###

## Generated 2024-10-15 20:40:20.205217Z
## By /Users/bashar.eid@viam.com/Developer/Flutters/3.19.6/flutter/bin/cache/flutter_tools.snapshot

# end FLUTTER zsh-completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bashar.eid@viam.com/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bashar.eid@viam.com/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bashar.eid@viam.com/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bashar.eid@viam.com/google-cloud-sdk/completion.zsh.inc'; fi

export PRETTIERD_DEFAULT_CONFIG=~/.prettierrc
