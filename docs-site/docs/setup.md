---
id: setup
title: Installation and Removal
---

## Install

```bash
./install.sh
```

What it does:

- Creates `$HOME/.config` if missing.
- Backs up any existing target files into
  `$HOME/.dotfiles-backup/<timestamp>`.
- Creates symlinks for bash, git, terminal, and editor configs.

## Uninstall

```bash
./uninstall.sh
```

What it does:

- Removes symlinks for `.bashrc`, `.gitconfig`, and `.gitignore_global`.
- Removes the Starship config symlink at `$HOME/.config/starship.toml`.
- Leaves your backup directory untouched.

## Backup behavior

The install script calls `backup()` before linking any file that already exists.
Backups are created once per install run in a timestamped directory.

## Notes

- `~/.bashrc` sources modules from `$HOME/dotfiles/shell/bash`.
  The install script also links copies into `~/.config/dotfiles/bash`.
  Keep both locations in sync or adjust the path in `.bashrc` if you prefer
  the `~/.config` location.
