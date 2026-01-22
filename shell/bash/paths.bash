# PATH helpers

path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_append() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

# User-local
path_prepend "$HOME/.local/bin"

# OpenCode
path_prepend "$HOME/.opencode/bin"

# VS Code on Windows (WSL only)
if grep -qi microsoft /proc/version 2>/dev/null; then
  path_append "/mnt/c/Users/blackout/AppData/Local/Programs/Microsoft VS Code/bin"
fi

export PATH
