#!/bin/sh
# Profile file. Runs on login.

# used to autologin
if [ -f /tmp/autologin ]
then
        rm -f /tmp/autologin
fi

# HOSTS addresses

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH=$PATH:~/.local/bin/
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM=$TERMINAL
export BROWSER="firefox"
export READER="xreader"
export SUDO_ASKPASS="$HOME/.local/bin/askpass"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export MOZ_USE_XINPUT2=1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] > /dev/null && source "$HOME/.bashrc" > /dev/null

# Start the graphical server on tty1
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx &> /dev/null

if [[ $(tty) == /dev/tty* ]] ; then setleds -D +num ; fi #enable Numlock 
