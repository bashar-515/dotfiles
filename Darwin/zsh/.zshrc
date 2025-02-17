if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

AUTOSUGGESTIONS="/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
SYNTAX_HIGHLIGHTING="/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [ -f "$AUTOSUGGESTIONS" ]; then
    source "$AUTOSUGGESTIONS"
fi

if [ -f "$SYNTAX_HIGHLIGHTING" ]; then
    source "$SYNTAX_HIGHLIGHTING"
fi

