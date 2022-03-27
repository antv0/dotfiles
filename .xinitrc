#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

export DESKTOP_SESSION=i3
exec i3
