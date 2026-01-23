#!/usr/bin/env zsh

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Dark-wallpapers"

# Pick a random file from this directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" \) | shuf -n 1)

# Kill existing swaybg (prevents stacking multiple processes)
pkill swaybg

# Set the new wallpaper
swaybg -i $WALLPAPER -m fill &
