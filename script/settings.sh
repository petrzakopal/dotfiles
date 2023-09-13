# setting typing speed
xset r rate 250 50


# setting gaming USB mouse speed
xinput --list --short # list devices
xinput --list-props 9 # where 9 is the id of the device
xinput --set-prop 9 338 -0.9 # to the device 9 set the property of acceleration to -0.9
