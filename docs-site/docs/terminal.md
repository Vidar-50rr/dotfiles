---
id: terminal
title: Terminal Configuration
---

Terminal configs live under `terminal/` and are linked by `install.sh`.

## Kitty

`terminal/kitty/kitty.conf`:

- Uses `current-theme.conf` for colors.
- Font: CaskaydiaMono Nerd Font (size 14).
- Cursor: underline with blink.
- Window padding and margins for breathing room.
- Transparent background (requires compositor such as picom).
- Clipboard and selection behaviors set for quick copy/paste.

`terminal/kitty/current-theme.conf`:

- Catppuccin Macchiato color scheme.

## Starship prompt

`terminal/starship.toml` controls prompt appearance and symbols.
It includes OS, user, hostname, directory, and git status segments with
custom symbols and colors.

## Windows Terminal

`terminal/windows-terminal/settings.json` provides:

- A Catppuccin Macchiato scheme.
- CaskaydiaMono Nerd Font Mono.
- Key bindings for copy/paste and pane duplication.

If you change fonts or themes, update the corresponding entries in both Kitty
and Windows Terminal to keep visual parity.
