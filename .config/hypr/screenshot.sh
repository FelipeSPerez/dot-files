#!/bin/bash

ultimo=$(ls $HOME/Pictures/Screenshots/ | sed -E 's/([0-9]+)\.png/\1/g' | sort -n | tail -1)
nuevo=$(($ultimo + 1))
filename="$HOME/Pictures/Screenshots/${nuevo}.png"

if [ "$1" == "region" ]; then
	grim -g "$(slurp)" -l 0 $filename
elif [ "$1" == "active" ]; then
	grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" -l 0 $filename
else
	grim -l 0 $filename
fi

wl-copy < $filename
