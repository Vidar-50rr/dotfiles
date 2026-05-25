---
id: maintenance
title: Maintenance and Troubleshooting
---

## Updating configs

- Edit files in the repository, not the symlink targets.
- Existing symlinks pick up file edits automatically.

## Backups

- Back up existing destination files manually before replacing them with
  symlinks.

## Common issues

- Missing fonts: install fonts from `fonts/` and restart the terminal.
- Prompt not showing: ensure `starship` is installed and on `PATH`.
- Bash modules not loading: verify `.bashrc` sources the intended directory.

## Adding new files

- Place new configs under the closest existing directory.
- Document the expected destination in Manual Installation and the relevant
  tool-specific page.
