#!/bin/bash
read path_wallpaper < <(find $HOME/Pictures/wallpapers -type f | shuf -n 1)
echo $path_wallpaper

#sleep 2s
#hyprctl hyprpaper preload $path_wallpaper
#hyprctl hyprpaper wallpaper ",contain:${path_wallpaper}"
#hyprctl hyprpaper wallpaper "DP-1,~/Pictures/myepicpng.png"

exec swww img --resize fit $path_wallpaper
