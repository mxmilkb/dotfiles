
#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


# Autostart X apps
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# ssh-agent
#broken in bspwm
# eval $(ssh-agent)


# Source .Xresources for this session
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Make additional fonts available
xset +fp /usr/share/fonts/local
xset fp rehash



numlockx &

# xsettings daemon - informs apps what themes to use
# xsettingsd &

# Set the mouse pointer graphic
xsetroot -cursor_name left_ptr &

# xrandr --output DVI-I-1 --mode 1280x1024 --pos 0x0 --output VGA-1 --mode 1024x768 --pos 1280x195

# https://wiki.archlinux.org/index.php/Libetc
# export LD_PRELOAD=libetc.so
# export LIBETC_BLACKLIST=/bin/cp:/bin/ln:/bin/ls:/bin/mv:/bin/rm:/usr/bin/find

# Set X background color to black
# hsetroot -solid "#000000"

# Set background image
# feh --bg-fill --no-xinerama ~/.wallpapers/VnXDN9J_colourised.png
feh --bg-fill --no-xinerama `return-wallpaper.sh`

# Unclutter - hides the mouse cursor after 15 seconds of idle
unclutter --timeout 15 &

# Start urxvt demon, quiet, connect to $DISPLAY, fork after control socket binding
# urxvtd -q -o -f &


# Automount devices, with smart system tray icon
udiskie -san &

# Composition manager
compton &
# compton -b										# see ~/.config/compton.conf
# compton --respect-prop-shadow -bc -t -8 -l -9 -r 6 -o 0.7 &
# compton -cCGfF -o 0.38 -O 200 -I 200 -t 0.02 -l 0.02 -r 3.2 -D2 -m 0.88 -i 0 &
# compton -cCGfzb -o 0.8 -O 200 -I 200 -t -9 -l -9 -r 6 -D 2 -m 0.98 -e 1 -i 1 --respect-prop-shadow  --shadow-ignore-shape

# Flash windows on focus
# flashfocus &

# Notification daemon. ctrl-space to close, ctrl-shift-space to close all.
# dunst &

# Update dynamic dns
# dyndns &


# pointerspeed.sh 0.5

# Script that changes a window border colour on urgent signal
#bspwm-urgent-border.sh &

# infrared control
# flirc_util loadconfig ~/.config/flirc/my_flirc_config

# Start Jack for audio
# jack_control start &
# cadence-session-start --start &    # doesn't start jack sometimes
# cadence-session-start --system-start

# Jack GUI 
# cadence --minimized &

# reset to primary monitor if secondary is removed (for after a use of mons -s)
mons -a &

# Panel bar w/ pager, systray, program windows, weather, time, etc.
# xfce4-panel --disable-wm-check &
# perlpanel &
# xde-panel &
# polybar sitting &


# snapcast reciever
# snapauto.sh &

# mpris from mpd server
# mpd-mpris -host 192.168.1.3 &
mpDris2 &

# make playerctl always target most recently active player
playerctld &


### Notification icon area / systray

# connect to mobile kdeconnect app
kdeconnect-indicator &

# copy middle-mouse PRIMARY selection to ctrl-xcv/shift-insert CLIPBOARD. mostly useful when without a mouse.
# autocutsel -fork &
# copy ctrl-xcv / shift-insert CLIPBOARD to middle mouse PRIMARY selection buffer
# autocutsel -selection PRIMARY -fork &
copyq &

# screenshot systray helper
flameshot &

# Break timer
# workrave &

# Volume system tray
# pa-applet &
#volti &
pasystray --no-icon-tooltip --no-notify --volume-max=100 &

# pnmixer &
# kmix &

# Radio streams
# radiotray-ng &
goodvibes --status-icon &


# Battery monitor
# [[ $HOST = "rose*" ]] && vattery &


# Folder sync tray GUI (using web interface instead)
syncthing-gtk &

# nextcloud &

signal-desktop --start-in-tray &

# keepassxc ~/state/nextcloud/sync/keepassxc-mb.kdbx &

# Octopi pacman update and package manager GUI
# pamac-tray &

# Hotkeys
# sxhkd &


# Make sure pulseaudio out is set to jack
# (sleep 30 && pacmd set-default-source jack_in && pacmd set-default-sink jack_out ) &

# Authentication agent
# pkttyagent &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# lxpolkit &
/usr/lib/xfce-polkit/xfce-polkit &



# export QT_QPA_PLATFORMTHEME=gtk2
# export QT_PLATFORMTHEME=gtk2
# export QT_PLATFORM_PLUGIN=qt5ct

# Use mouse button8 as left windows key
# xinput set-button-map 1 2 3 4 5 6 7 12 9 10 11 12
# button8-to-lwin.py &

# Cat
#oneko -fg "#555" -bg "#000" -time 200000 -position +200+200 &


# Start xscreensaver - disabled to save power
# xscreensaver -nosplash &
# Disable screen blanking
xset dpms 0 0 0
xset -dpms
xset s noblank


# fix wonkey internal laptop keyboard
FLOATKB=`xinput | grep Translated | awk -F ' ' '{print substr($7,length($7)-1,length($7))}'` && xinput float $FLOATKB


# eval `luarocks path --bin`


# Redshift - changed screen colour temp
redshift-gtk -l 55.978301:-3.228586 -t 6000:4500 &
# sleep 6 && gammy &

# sleep 6 && agordejo --session-root ~/media/audio/projects/NSM --load-session 0_base --hide &

# sleep 9 && laptop-no-internal.sh &


# Set Xorg keyboard layout
setxkbmap gb


# xrandr-rose-vgaprime-hdmiright.sh

# ~/.screenlayout/laptop-no-internal.sh


# Disable screensaver on media fullscreen
# lightsOn 545 &
#doesn't work??
# caffeine &
### Window manager

# exec startlxde
# exec cinnamon-session

# exec i3
# exec enlightenment_start
# exec audacity
# exec tdm --xstart
# exec i3 >> /var/tmp/log/i3log 2>&1

# exec adwm -f ~/.config/adwm/adwmrc
# exec adwm
# exec xde-session choose

# exec selectwm
# exec xterm
# exec urxvt


exec awesome
# exec bspwm
# exec ssh-agent bspwm
# exec bspwm -c /home/milk/sync/dotfiles/bspwm/.config/bspwm/bspwmrc
# exec bspwm -c /home/milk/.config/bspwm/bspwmrc
# exec startxfce4
# exec herbstluftwm
# exec howm
# exec fvwm2
# exec openbox
