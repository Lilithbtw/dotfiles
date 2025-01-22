#!/bin/zsh

ACTIVE=`hyprctl activewindow | grep pid | cut -f2 -d " "`
kill -9 $ACTIVE
