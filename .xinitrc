#!/bin/bash

# Autostart
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/autostart" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/autostart"

while true; do
        xsetroot -name "$(sh ~/.scripts/info.sh)"
        sleep 1
done &

xrdb -merge ~/.Xresources && exec dwm

