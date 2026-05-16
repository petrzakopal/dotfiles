#!/bin/sh

set -e

# Keep sudo alive
sudo -v

# for cachy OS
#rate-mirrors cachyos | sudo tee /etc/pacman.d/cachyos-mirrorlist

# simpler
sudo cachyos-rate-mirrors

# for arch
rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist


# refresh the pacman database
sudo pacman -Syy
