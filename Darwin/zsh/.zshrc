if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

GIT_COMPLETION_SCRIPT="$HOME/.git-completion.zsh"
if [[ -e "$GIT_COMPLETION_SCRIPT" ]]; then
    source "$GIT_COMPLETION_SCRIPT"
fi

AUTOSUGGESTIONS="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f "$AUTOSUGGESTIONS" ]; then
    source "$AUTOSUGGESTIONS"
fi

SYNTAX_HIGHLIGHTING="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f "$SYNTAX_HIGHLIGHTING" ]; then
    source "$SYNTAX_HIGHLIGHTING"
fi

AUTOCOMPLETE="/opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
if [ -f "$AUTOCOMPLETE" ]; then
    source "$AUTOCOMPLETE"
fi

ALIASES_PATH="$HOME/.aliases"
if [ -e "$ALIASES_PATH" ]; then
    source "$ALIASES_PATH"
fi

if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

export BAT_THEME=gruvbox-dark

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi
