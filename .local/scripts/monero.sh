#!/bin/sh

thread=12

[ -n $1 ] && thread=$1

sudo xmrig --donate-level 0 --thread=$thread -o fr.minexmr.com:80 --randomx-mode=fast --randomx-1gb-pages -u $XMR_ADDRESS_MINE -k
