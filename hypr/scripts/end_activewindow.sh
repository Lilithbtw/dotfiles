#!/bin/env zsh

ACTIVE=$(hyprctl activewindow | grep pid | cut -f2 -d " " | tail +3)
kill -9 $ACTIVE
