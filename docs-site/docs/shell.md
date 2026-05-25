---
id: shell
title: Shell Configuration
---

Shell files live in `shell/bash/` and are loaded by `shell/bash/.bashrc`.
The `.bashrc` only runs for interactive shells and then sources the modules.

## Files

- `shell/bash/.bashrc`
  - Loads `env.bash`, `paths.bash`, and `aliases.bash` if present.
  - Initializes bash completion when available.
  - Sources `nvm.bash` and `sdkman.bash` near the end.
  - Sets `EDITOR=micro`.
  - Sources `$HOME/.bashrc.local` for private machine-specific settings.
- `shell/bash/env.bash`
  - Shell behavior: history settings and window size checks.
- `shell/bash/paths.bash`
  - `path_prepend` and `path_append` helpers.
  - Adds `$HOME/.local/bin` and `$HOME/.opencode/bin` to `PATH`.
- `shell/bash/aliases.bash`
  - Common `ls` aliases and colorized tools.
  - Maps `batcat` to `bat` on Debian/Ubuntu.
- `shell/bash/nvm.bash`
  - Loads NVM and bash completion if installed.
- `shell/bash/sdkman.bash`
  - Loads SDKMAN if installed.

## Editing guidelines

- Keep helper functions simple and POSIX-friendly.
- Quote variables in paths and conditionals.
- Prefer sourcing files conditionally with `[ -f ... ]` checks.
- Add new modules under `shell/bash/` and source them from `.bashrc`.
- Keep secrets, private key paths, and host-specific setup in `$HOME/.bashrc.local`.

## Path note

`.bashrc` expects modules under `$HOME/dotfiles/shell/bash`. Keep the repository
at `~/dotfiles` or adjust `DOTFILES_BASH_DIR` if you use another clone path.
