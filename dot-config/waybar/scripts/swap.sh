#!/usr/bin/env zsh

# Set the path to the style files
style_file="${HOME}/.config/waybar/style.css"
style_background_file="${HOME}/.config/waybar/style-background.css"

# Swap names of style files
mv "${style_file}" "${style_file}.temp"
mv "${style_background_file}" "${style_file}"
mv "${style_file}.temp" "${style_background_file}"

echo "File names swapped successfully!"

pkill -x waybar && swaymsg reload && waybar &
