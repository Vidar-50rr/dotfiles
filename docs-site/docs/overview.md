---
id: overview
title: Dotfiles Overview
slug: /
---

This repository contains personal dotfiles and configuration assets for shell,
terminal, editor, and git workflows. The install script creates symlinks into
your home directory and backs up existing files before linking.

## Quick start

```bash
git clone git@github.com:Vidar-50rr/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

To remove the symlinks later:

```bash
./uninstall.sh
```

## What is included

- Bash configuration and modularized shell files.
- Git defaults and a global ignore list.
- Terminal profiles, themes, and prompt configuration.
- Micro editor settings and key bindings.
- Linux package list, fonts, and a wallpaper asset.

## How to use these docs

- Start with Installation for setup details and backup behavior.
- Use Repository Layout to see where each configuration lives.
- Dive into the Shell, Git, Editor, and Terminal sections for file specifics.
