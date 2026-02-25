# Peafowl Colors

A colorscheme inspired by the plumage of the peafowl — emerald, sapphire, amethyst, and more.

![](https://img.p3ac0ck.net/figs/peafowl-colors.png)

## Targets

### [Neovim](./nvim/)

Lua colorscheme plugin for Neovim (>= 0.9.0). Provides highlight definitions for editor UI, Vim syntax groups, Tree-sitter captures, and the built-in terminal emulator.

```lua
require("peafowl_colors").setup({})
vim.cmd.colorscheme("peafowl")
```

See `:help peafowl-colors` for full documentation.

### [Ghostty](./ghostty/)

Theme file for the [Ghostty](https://ghostty.org) terminal emulator. Maps the peafowl palette to the 16 ANSI color slots along with background, foreground, cursor, and selection colors.

Symlink or copy the theme into Ghostty's config directory:

```bash
# Linux / macOS
ln -s /path/to/peafowl-colors/ghostty/peafowl.conf ~/.config/ghostty/themes/peafowl.conf
```

Then set in your Ghostty config:

```
theme = peafowl.conf
```

### [tmux](./tmux/)

tmux theme plugin inspired by [catppuccin/tmux](https://github.com/catppuccin/tmux). Provides configurable window, pane, and status line styling with the peafowl palette.

```bash
# In tmux.conf
run-shell "/path/to/peafowl-colors/tmux/peafowl.sh"
```
