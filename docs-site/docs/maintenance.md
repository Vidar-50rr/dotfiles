---
id: maintenance
title: Maintenance and Troubleshooting
---

## Updating configs

- Edit files in the repository, not the symlink targets.
- Re-run `./install.sh` to refresh symlinks after adding new files.

## Backups

- Backups are stored under `$HOME/.dotfiles-backup/<timestamp>`.
- Each install run creates a new backup directory.

## Common issues

- Missing fonts: install fonts from `fonts/` and restart the terminal.
- Prompt not showing: ensure `starship` is installed and on `PATH`.
- Bash modules not loading: verify `.bashrc` sources the intended directory.

## Adding new files

- Place new configs under the closest existing directory.
- Add a `link` call in `install.sh` and document the path here.
