if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

ALIASES_PATH="$HOME/.aliases"
if [ -e "$ALIASES_PATH" ]; then
    source "$ALIASES_PATH"
fi

export BAT_THEME=gruvbox-dark

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

if command -v fzf &> /dev/null; then
  source <(fzf --bash)
fi
