eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

fastfetch

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

. ~/.aliases
