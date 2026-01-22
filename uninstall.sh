#!/usr/bin/env bash
set -e

log() {
  echo "[dotfiles] $1"
}

unlink() {
  local dest="$1"

  if [ -L "$dest" ]; then
    rm "$dest"
    log "Removed symlink $dest"
  else
    log "Skipping $dest (not a symlink)"
  fi
}

# Bash
unlink "$HOME/.bashrc"

# Git
unlink "$HOME/.gitconfig"
unlink "$HOME/.gitignore_global"

# Starship
unlink "$HOME/.config/starship.toml"

log "Uninstall completed"
