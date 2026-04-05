#!/bin/sh
set -e

# Keep sudo alive
sudo -v

# Check yay
if ! command -v yay >/dev/null 2>&1; then
  echo "yay is not installed. Install it first."
  exit 1
fi

# AUR packages
yay -S --needed --noconfirm \
  tree-sitter-cli-git \
  ripgrep \
  google-chrome \
  thunderbird \
  fastfetch

# Official packages
sudo pacman -S --needed --noconfirm \
  fd \
  zsh \
  networkmanager \
  nm-connection-editor \
  blueman \
  fuse2 \
  network-manager-applet \
  blueman

# Enable services
sudo systemctl enable --now NetworkManager

# Set zsh as default shell
chsh -s "$(which zsh)"
