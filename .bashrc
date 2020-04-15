#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
# shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# export PS1="\[$(tput bold > /dev/null)\]\[$(tput setaf 5 > /dev/null)\][\[$(tput setaf 3 > /dev/null)\]\u\[$(tput setaf 2 > /dev/null)\]@\[$(tput setaf 4 > /dev/null)\]\h \[$(tput setaf 6 > /dev/null)\]\W\[$(tput setaf 5 > /dev/null)\]]\[$(tput setaf 7 > /dev/null)\]$ \[$(tput sgr0 > /dev/null)\]"
export PS1="\[$(tput bold)\]\[$(tput setaf 5)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 6)\]\W\[$(tput setaf 5)\]]\[$(tput setaf 7)\]$ \[$(tput sgr0)\]" 

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

tput smkx #allow delete key to work in terminal emulator
