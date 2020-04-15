#!/bin/sh

printf " " && pacman -Qu | grep -v "\[ignoré\]" | wc -l
