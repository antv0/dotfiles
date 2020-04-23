#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE= HISTFILESIZE= # Infinite history.

export PS1="\[$(tput bold)\]\[$(tput setaf 5)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 5)\]]\[$(tput setaf 7)\]$ \[$(tput sgr0)\]" 

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

tput smkx #allow delete key to work in terminal emulator
