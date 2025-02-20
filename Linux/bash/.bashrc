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
