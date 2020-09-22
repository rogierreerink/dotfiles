#!/bin/sh
#
# ~/.xinitrc
#

# Load X resources
if [ -f "$HOME/.Xresources" ]; then
	xrdb -merge "$HOME/.Xresources";
fi
if [ -f "$HOME/.Xmodmap" ]; then
	xmodmap "$HOME/.Xmodmap";
fi
if [ -f "/etc/X11/xinit/.Xresources" ]; then
	xrdb -merge "/etc/X11/xinit/.Xresources";
fi
if [ -f "/etc/X11/xinit/.Xmodmap" ]; then
	xmodmap "/etc/X11/xinit/.Xmodmap";
fi

# Run global xinit scripts
if [ -d "/etc/X11/xinit/xinitrc.d" ]; then
	for f in "/etc/X11/xinit/xinirc.d/?*.sh"; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Configure displays
autorandr -c &

# Start compositor
picom &

# Set wallpaper
[[ -x "$HOME/.fehbg" ]] && "$HOME/.fehbg";

# Start conky
conky &

# Start dock
tint2 &

# Start redshift
redshift &

# Start notification daemon
xfce4-notifyd &

# Configure key bindings
xbindkeys &

# Start X session
exec openbox-session

