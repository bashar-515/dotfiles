if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

AUTOSUGGESTIONS="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [ -f "$AUTOSUGGESTIONS" ]; then
    source "$AUTOSUGGESTIONS"

    # gruvbox-material grey1
    export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374"
fi

SYNTAX_HIGHLIGHTING="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
if [ -f "$SYNTAX_HIGHLIGHTING" ]; then
    source "$SYNTAX_HIGHLIGHTING"
fi

ALIASES_PATH="$HOME/.aliases"
if [ -e "$ALIASES_PATH" ]; then
    source "$ALIASES_PATH"
fi
