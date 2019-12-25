#!/bin/sh
killall polybar
xrandr --output LVDS1 --off --output DP1 --off --output HDMI1 --off --output VGA1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
feh --bg-fill --no-xinerama ~/.wallpapers/danielle_at_sea_flickr.jpg
polybar sitting-tray &