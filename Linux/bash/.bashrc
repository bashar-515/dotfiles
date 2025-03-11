if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

GIT_COMPLETION_SCRIPT="$HOME/.git-completion.bash"
if [[ -e "$GIT_COMPLETION_SCRIPT" ]]; then
    source "$GIT_COMPLETION_SCRIPT"
fi

ALIASES_PATH="$HOME/.aliases"
if [ -e "$ALIASES_PATH" ]; then
    source "$ALIASES_PATH"
fi

if command -v fzf &> /dev/null; then
  source <(fzf --bash)
fi

export BAT_THEME=gruvbox-dark

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
