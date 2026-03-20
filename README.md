# mac_setup

My macOS developer setup — Neovim + SketchyBar + AeroSpace + Superfile — installable with one command.

## Install

```bash
git clone https://github.com/sid1081/mac-setup.git ~/mac-setup && cd ~/mac-setup && chmod +x install.sh && ./install.sh
```

That's it. The script will:

1. Install **Homebrew** if missing
2. Install all **brew packages** (Neovim, SketchyBar, AeroSpace, fonts, tools) via `Brewfile`
3. **Symlink** configs → `~/.config/nvim`, `~/.config/sketchybar`, `~/.aerospace.toml`, `~/Library/Application Support/superfile/`
4. Copy **DankMono** fonts to `~/Library/Fonts/`
5. Install all **Neovim plugins** headlessly via lazy.nvim
6. **Restart SketchyBar** and launch AeroSpace

## What's included

### Neovim (`nvim/`)

- **Base:** [NvChad v2.5](https://nvchad.com) with tokyonight theme
- **Plugins:** LSP, Treesitter, Telescope, nvim-cmp, conform, nvim-tree, Comment, indent-blankline, supermaven, mcphub
- **Keymaps:** Helix-inspired (`x` for visual line, `gl`/`gs` for line ends, `ge` for EOF)
- **Extras:** Relative line numbers, inline LSP diagnostics, statusline clock, auto-open file tree

### SketchyBar (`sketchybar/`)

- Transparent/frosted bar with adaptive laptop/desktop layout (detects built-in vs external display)
- Shows: macOS space, AeroSpace workspace, active app, weather, clock, battery, volume, YouTube Music / Spotify
- AeroSpace workspace widget updates in real time when switching workspaces (`⎇ 1`)

### AeroSpace (`aerospace.toml`)

- Tiling window manager, starts at login
- **Focus:** `Alt + h/j/k/l`
- **Move window:** `Alt + Shift + h/j/k/l`
- **Resize mode:** `Alt + r`, then `h/j/k/l` (`Shift` for larger steps), `Esc` to exit
- **Join windows:** `Alt + v` (join right) / `Alt + s` (join down)
- **Toggle float:** `Alt + f` | **Fullscreen:** `Alt + Shift + f`
- **Workspaces:** `Alt + 1-9` to switch, `Alt + Shift + 1-9` to send window there
- **Back and forth:** `Alt + Tab`
- **Reload config:** `Alt + Shift + r`
- Auto-assigns apps to workspaces: terminal→1, browser→2, Slack/Mail→3, Notion→4, Spotify→9

### Superfile (`superfile/`)

- Terminal file manager — launch with `spf`
- **Theme:** catppuccin-mocha with Nerd Fonts icons
- **Navigation:** vim-style (`h/j/k/l`), `/` to search, `.` to toggle dotfiles
- **File ops:** `ctrl+c/x/v` copy/cut/paste, `ctrl+n` create, `ctrl+r` rename, `D` permanent delete
- **Panels:** `n` new panel, `w` close panel, `Tab`/`Shift+Left` cycle panels
- **Preview:** `f` toggle file preview, `e` open in editor, `E` open directory in editor
- **Extras:** file preview on hover, image preview, zoxide integration (`z`)

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
