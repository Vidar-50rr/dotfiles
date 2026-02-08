---
id: layout
title: Repository Layout
---

Top-level structure and intent:

| Path | Purpose |
| --- | --- |
| `assets/` | Static assets such as wallpapers. |
| `editor/` | Editor configuration (Micro). |
| `fonts/` | Fonts used by terminal and editor settings. |
| `git/` | Git config and global ignore file. |
| `linux/` | Linux package list for bootstrapping. |
| `shell/` | Bash configuration and modular shell files. |
| `terminal/` | Kitty, Starship, and Windows Terminal configuration. |
| `install.sh` | Install script that links configs and creates backups. |
| `uninstall.sh` | Uninstall script that removes symlinks. |

If you add new configuration files, update `install.sh` and document the new
path in the relevant section of these docs.
