eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init bash)"

eval "$(starship init bash)"

fastfetch

. ~/.aliases
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
