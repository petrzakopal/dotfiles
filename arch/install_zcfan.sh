#!/usr/bin/env bash
set -euo pipefail

echo "Installing zcfan..."
sudo pacman -S --needed --noconfirm zcfan

echo "Writing /etc/zcfan.conf..."
sudo tee /etc/zcfan.conf >/dev/null <<'EOF'
low_temp 45
med_temp 55
max_temp 65

temp_hysteresis 5
watchdog_secs 30
EOF

echo "Enabling zcfan service..."
sudo systemctl enable zcfan

echo
echo "=================================================="
echo "zcfan has been installed and configured."
echo
echo "Run the second script to enable manual fan control."
echo "=================================================="
