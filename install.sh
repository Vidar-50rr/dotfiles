#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Skipping $dest (already exists)"
  else
    ln -s "$src" "$dest"
    echo "Linked $dest → $src"
  fi
}

# Shell
link "$DOTFILES_DIR/shell/bash/.bashrc" "$HOME/.bashrc"
link "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc"

# Git
link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
link "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# Starship
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/terminal/starship.toml" "$HOME/.config/starship.toml"
