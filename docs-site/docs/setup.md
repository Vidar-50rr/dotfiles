---
id: setup
title: Manual Installation
---

## Clone Path

```bash
git clone git@github.com:Vidar-50rr/dotfiles.git ~/dotfiles
```

`shell/bash/.bashrc` expects modules under `$HOME/dotfiles/shell/bash`. Keep the
repository at `~/dotfiles` or adjust `DOTFILES_BASH_DIR` in `.bashrc`.

## Recommended Links

Back up existing files before replacing them. Then create the config directories
and symlinks you want to manage from this repo.

```bash
mkdir -p "$HOME/.config/micro" "$HOME/.config/kitty"

ln -s "$HOME/dotfiles/shell/bash/.bashrc" "$HOME/.bashrc"
ln -s "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ln -s "$HOME/dotfiles/git/.gitignore_global" "$HOME/.gitignore_global"
ln -s "$HOME/dotfiles/terminal/starship.toml" "$HOME/.config/starship.toml"
ln -s "$HOME/dotfiles/editor/micro/settings.json" "$HOME/.config/micro/settings.json"
ln -s "$HOME/dotfiles/editor/micro/bindings.json" "$HOME/.config/micro/bindings.json"
ln -s "$HOME/dotfiles/terminal/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -s "$HOME/dotfiles/terminal/kitty/current-theme.conf" "$HOME/.config/kitty/current-theme.conf"
```

## Target Map

| Source | Destination |
| --- | --- |
| `shell/bash/.bashrc` | `$HOME/.bashrc` |
| `git/.gitconfig` | `$HOME/.gitconfig` |
| `git/.gitignore_global` | `$HOME/.gitignore_global` |
| `terminal/starship.toml` | `$HOME/.config/starship.toml` |
| `editor/micro/settings.json` | `$HOME/.config/micro/settings.json` |
| `editor/micro/bindings.json` | `$HOME/.config/micro/bindings.json` |
| `terminal/kitty/kitty.conf` | `$HOME/.config/kitty/kitty.conf` |
| `terminal/kitty/current-theme.conf` | `$HOME/.config/kitty/current-theme.conf` |

## Manual Files

- Put private shell setup in `$HOME/.bashrc.local`; it is sourced by `.bashrc`
  and must not be committed.
- Put private Git identity and credential helpers in `$HOME/.gitconfig.local`;
  it is included by `.gitconfig` and must not be committed.
- Install fonts from `fonts/` through your desktop/font manager.
- Merge `terminal/windows-terminal/settings.json` into the Windows Terminal
  profile manually.

## Removal

Remove only symlinks you created and leave real user files untouched.
