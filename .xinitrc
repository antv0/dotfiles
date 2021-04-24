#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

export DESKTOP_SESSION=bspwm
exec i3

