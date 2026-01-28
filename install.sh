#!/usr/bin/env bash
set -e

# Absolute path to the dotfiles repository
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

log() {
  echo "[dotfiles] $1"
}

backup() {
  local target="$1"

  mkdir -p "$BACKUP_DIR"
  mv "$target" "$BACKUP_DIR/"
  log "Backed up $target → $BACKUP_DIR"
}

link() {
  local src="$1"
  local dest="$2"

  # Destination exists
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    # Already correct symlink
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
      log "OK $dest already linked"
      return
    fi

    # Existing file or wrong symlink → backup
    backup "$dest"
  fi

  ln -s "$src" "$dest"
  log "Linked $dest → $src"
}

log "Installing dotfiles from $DOTFILES_DIR"

# Ensure config dir exists
mkdir -p "$HOME/.config"

# Main bashrc
link "$DOTFILES_DIR/shell/bash/.bashrc" "$HOME/.bashrc"

# Modular bash files (kept under ~/.config/dotfiles/bash)
mkdir -p "$HOME/.config/dotfiles/bash"
link "$DOTFILES_DIR/shell/bash/env.bash"     "$HOME/.config/dotfiles/bash/env.bash"
link "$DOTFILES_DIR/shell/bash/paths.bash"   "$HOME/.config/dotfiles/bash/paths.bash"
link "$DOTFILES_DIR/shell/bash/aliases.bash" "$HOME/.config/dotfiles/bash/aliases.bash"
link "$DOTFILES_DIR/shell/bash/nvm.bash"     "$HOME/.config/dotfiles/bash/nvm.bash"
link "$DOTFILES_DIR/shell/bash/sdkman.bash"  "$HOME/.config/dotfiles/bash/sdkman.bash"

# Git
link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# Starship
link "$DOTFILES_DIR/terminal/starship.toml" "$HOME/.config/starship.toml"

# Micro
mkdir -p "$HOME/.config/micro"
link "$DOTFILES_DIR/editor/micro/settings.json" "$HOME/.config/micro/settings.json"
link "$DOTFILES_DIR/editor/micro/bindings.json" "$HOME/.config/micro/bindings.json"

# Kitty
link "$DOTFILES_DIR/terminal/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES_DIR/terminal/kitty/current-theme.conf" "$HOME/.config/kitty/current-theme.conf"

