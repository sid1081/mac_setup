#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> mac_setup: starting install"

# ── 1. Homebrew ──────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for Apple Silicon
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# ── 2. Brew packages ──────────────────────────────────────────────────────────
echo "==> Installing brew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# ── 3. Symlink configs ────────────────────────────────────────────────────────
echo "==> Symlinking configs..."
mkdir -p ~/.config

# Neovim
if [ -e ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
  echo "    Backing up existing ~/.config/nvim to ~/.config/nvim.bak"
  mv ~/.config/nvim ~/.config/nvim.bak
fi
ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
echo "    ~/.config/nvim -> $DOTFILES_DIR/nvim"

# SketchyBar
if [ -e ~/.config/sketchybar ] && [ ! -L ~/.config/sketchybar ]; then
  echo "    Backing up existing ~/.config/sketchybar to ~/.config/sketchybar.bak"
  mv ~/.config/sketchybar ~/.config/sketchybar.bak
fi
ln -sf "$DOTFILES_DIR/sketchybar" ~/.config/sketchybar
echo "    ~/.config/sketchybar -> $DOTFILES_DIR/sketchybar"

# ── 4. Fonts ──────────────────────────────────────────────────────────────────
if [ -d "$DOTFILES_DIR/fonts" ] && ls "$DOTFILES_DIR/fonts"/*.{otf,ttf} &>/dev/null 2>&1; then
  echo "==> Installing fonts..."
  cp "$DOTFILES_DIR/fonts/"*.otf ~/Library/Fonts/ 2>/dev/null || true
  cp "$DOTFILES_DIR/fonts/"*.ttf ~/Library/Fonts/ 2>/dev/null || true
fi

# ── 5. Neovim plugins ─────────────────────────────────────────────────────────
echo "==> Installing Neovim plugins (this may take a minute)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

# Install treesitter parsers
nvim --headless "+TSUpdateSync" +qa 2>/dev/null || true

# Install Playwright browser for consent-vision renderer (optional)
if command -v playwright &>/dev/null; then
  echo "==> Installing Playwright Chromium..."
  playwright install chromium
fi

# ── 6. AeroSpace ─────────────────────────────────────────────────────────────
echo "==> Symlinking AeroSpace config..."
if [ -e ~/.aerospace.toml ] && [ ! -L ~/.aerospace.toml ]; then
  echo "    Backing up existing ~/.aerospace.toml to ~/.aerospace.toml.bak"
  mv ~/.aerospace.toml ~/.aerospace.toml.bak
fi
ln -sf "$DOTFILES_DIR/aerospace.toml" ~/.aerospace.toml
echo "    ~/.aerospace.toml -> $DOTFILES_DIR/aerospace.toml"

# ── 7. SketchyBar ─────────────────────────────────────────────────────────────
echo "==> Starting SketchyBar..."
brew services restart sketchybar

echo ""
echo "✅ Done! Open a new terminal window and launch nvim."
echo "   Launch AeroSpace from Applications or run: open -a AeroSpace"
echo "   If fonts look wrong, log out and back in to refresh font cache."
