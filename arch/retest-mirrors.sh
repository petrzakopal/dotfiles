#!/bin/sh

set -e

# Keep sudo alive
sudo -v

# for cachy OS
#rate-mirrors cachyos | sudo tee /etc/pacman.d/cachyos-mirrorlist

# for arch
#rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist

# simpler
sudo cachyos-rate-mirrors

# refresh the pacman database
sudo pacman -Syy
