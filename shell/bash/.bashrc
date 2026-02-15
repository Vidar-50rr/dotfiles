# ~/.bashrc - interactive shells only

case $- in
  *i*) ;;
  *) return ;;
esac

# Load modular config (if present)
DOTFILES_BASH_DIR="$HOME/dotfiles/shell/bash"

[ -f "$DOTFILES_BASH_DIR/env.bash" ] && . "$DOTFILES_BASH_DIR/env.bash"
[ -f "$DOTFILES_BASH_DIR/paths.bash" ] && . "$DOTFILES_BASH_DIR/paths.bash"
[ -f "$DOTFILES_BASH_DIR/aliases.bash" ] && . "$DOTFILES_BASH_DIR/aliases.bash"

# Completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Tooling init (keep near end)
[ -f "$DOTFILES_BASH_DIR/nvm.bash" ] && . "$DOTFILES_BASH_DIR/nvm.bash"
[ -f "$DOTFILES_BASH_DIR/sdkman.bash" ] && . "$DOTFILES_BASH_DIR/sdkman.bash"
# [ -f "$DOTFILES_BASH_DIR/prompt.bash" ] && . "$DOTFILES_BASH_DIR/prompt.bash"

# Starship prompt (must be last prompt-related line)
command -v starship >/dev/null 2>&1 && eval "$(starship init bash)"
