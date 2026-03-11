#!/bin/bash

WALLPAPER_DIR="$HOME/Imagens/wallpaper"

chosen=$(ls "$WALLPAPER_DIR" | rofi -dmenu -p "Wallpaper")

[ -z "$chosen" ] && exit

swww img "$WALLPAPER_DIR/$chosen" --transition-type center
