#!/bin/sh
# Profile file. Runs on login.

# used to autologin
if [ -f /tmp/autologin ]
then
        rm -f /tmp/autologin
fi

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH=$PATH:~/.local/bin/
export EDITOR="nvim"
export TERMINAL="kitty"
export TERM="kitty"
export BROWSER="firefox"
export READER="xreader"
export FILE="ranger"
export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export MOZ_USE_XINPUT2=1

# Android 
export ANDROID_SDK_ROOT=/home/ant/per/android-sdk
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin"

#add opam bins to path
if [ -d ~/.opam/default/bin ]
then
    export PATH=$PATH:~/.opam/default/bin
fi

[ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] > /dev/null && source "$HOME/.bashrc" > /dev/null

#démare le serveur graphique s'il n'est pas déja en cours d'execution
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx &> /dev/null

if [[ $(tty) == /dev/tty* ]] ; then setleds -D +num ; fi #enable Numlock 

