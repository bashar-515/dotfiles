DARWIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed."
    exit 1
fi

if [[ ! -e "$DARWIN_DIR/Brewfile" ]]; then
    echo "$COMMON_DIR does not exist"
    exit 1
fi

brew bundle
