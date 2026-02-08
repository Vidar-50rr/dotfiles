---
id: git
title: Git Configuration
---

Git configuration is stored under `git/` and linked into the home directory.

## Files

- `git/.gitconfig`
  - `core.autocrlf = input` for consistent line endings.
  - `init.defaultBranch = master`.
  - `pull.rebase = false`.
  - `push.autoSetupRemote = true`.
- `git/.gitignore_global`
  - Global ignores for OS files, IDEs, build outputs, node artifacts, logs,
    and dotenv files.

## Usage

The install script links these files to:

- `$HOME/.gitconfig`
- `$HOME/.gitignore_global`

If you add more global ignores, keep entries grouped by tool or runtime and
avoid project-specific patterns.
