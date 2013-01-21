#!/bin/sh

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

# fix Java (GUI appears gray only)
#wmname LG3D

# switch off annoying bell
xset b off

# keyboard layout
#setxkbmap -layout "us,cz" -variant ",qwerty" -option grp:switch,grp:caps_toggle,grp_led:caps

#conky -c ~/.conky/conky_red/conkyrc_red

exec /usr/bin/startxfce4
