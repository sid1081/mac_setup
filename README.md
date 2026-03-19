# mac_setup

My macOS developer setup — Neovim + SketchyBar — installable with one command.

## Install

```bash
git clone https://github.com/siddharthsambharia-portkey/mac_setup.git ~/mac_setup && cd ~/mac_setup && chmod +x install.sh && ./install.sh
```

That's it. The script will:

1. Install **Homebrew** if missing
2. Install all **brew packages** (Neovim, SketchyBar, fonts, tools) via `Brewfile`
3. **Symlink** `nvim/` → `~/.config/nvim` and `sketchybar/` → `~/.config/sketchybar`
4. Copy **DankMono** fonts to `~/Library/Fonts/`
5. Install all **Neovim plugins** headlessly via lazy.nvim
6. **Restart SketchyBar**

## What's included

### Neovim (`nvim/`)

- **Base:** [NvChad v2.5](https://nvchad.com) with tokyonight theme
- **Plugins:** LSP, Treesitter, Telescope, nvim-cmp, conform, nvim-tree, Comment, indent-blankline, supermaven, mcphub
- **Keymaps:** Helix-inspired (`x` for visual line, `gl`/`gs` for line ends, `ge` for EOF)
- **Extras:** Relative line numbers, inline LSP diagnostics, statusline clock, auto-open file tree

### SketchyBar (`sketchybar/`)

- Transparent/frosted bar with adaptive laptop/desktop layout (detects built-in vs external display)
- Shows: workspace, active app, weather, clock, battery, volume, YouTube Music / Spotify

### Fonts (`fonts/`)

- **DankMono** — main editor font (Regular, Bold, Italic) ⚠️ commercial license, included for personal use
- **JetBrainsMono Nerd Font** — used in SketchyBar (installed via Homebrew)
- **Hack Nerd Font** + **Meslo LG Nerd Font** — also installed via Homebrew

## Requirements

- macOS 13+
- Internet connection (Homebrew, plugins)
- For SketchyBar: disable macOS system menu bar in System Settings → Control Centre → Automatically hide and show menu bar → Always

## Updating

Since configs are symlinked, changes made in `~/.config/nvim` or `~/.config/sketchybar` are reflected directly in this repo — just `git add` and push.
