#!/usr/bin/env bash
set -euo pipefail

echo "Reloading thinkpad_acpi with fan_control=1..."

if lsmod | grep -q '^thinkpad_acpi'; then
    sudo modprobe -r thinkpad_acpi
fi

sudo modprobe thinkpad_acpi fan_control=1

echo
echo -n "fan_control = "
cat /sys/module/thinkpad_acpi/parameters/fan_control

echo
echo "Restarting zcfan..."
sudo systemctl restart zcfan

echo
echo "Current status:"
systemctl --no-pager status zcfan

echo
echo "Fan information:"
cat /proc/acpi/ibm/fan
