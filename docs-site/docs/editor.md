---
id: editor
title: Micro Editor
---

Micro configuration lives under `editor/micro/` and is linked to
`$HOME/.config/micro` by the install script.

## Settings

`editor/micro/settings.json`:

- `clipboard`: terminal
- `colorscheme`: nord-tc
- `hlsearch`: true
- `jumpcursor`: true
- `smartindent`: true
- `softwrap`: true
- `tabsize`: 2

## Key bindings

`editor/micro/bindings.json`:

- `Alt-/`: toggle comment
- `CtrlUnderscore`: toggle comment

If you add plugins or new bindings, keep them grouped by feature and prefer
short, discoverable shortcuts.
