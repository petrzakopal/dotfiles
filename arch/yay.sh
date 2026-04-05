#!/bin/sh
set -e

WORKDIR="/tmp/yay-install"

# Install dependencies
sudo pacman -S --needed --noconfirm base-devel git

# Prepare clean workspace
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

# Clone and build yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm --needed
