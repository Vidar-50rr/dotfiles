---
id: git
title: Git Configuration
---

Git configuration is stored under `git/` and should be linked into the home
directory.

## Files

- `git/.gitconfig`
  - `core.autocrlf = input` for consistent line endings.
  - `init.defaultBranch = master`.
  - `pull.rebase = false`.
  - `push.autoSetupRemote = true`.
  - Includes `$HOME/.gitconfig.local` for private machine-specific overrides.
- `git/.gitignore_global`
  - Global ignores for OS files, IDEs, build outputs, node artifacts, logs,
    and dotenv files.

## Target Paths

- `$HOME/.gitconfig`
- `$HOME/.gitignore_global`

## Local Overrides

Put private identity and host-specific Git settings in `$HOME/.gitconfig.local`.
Because it is included after the shared settings, values there override the
public defaults.

Example:

```ini
[user]
  name = your-private-name
  email = your-private-email@example.com
```

If you add more global ignores, keep entries grouped by tool or runtime and
avoid project-specific patterns.
