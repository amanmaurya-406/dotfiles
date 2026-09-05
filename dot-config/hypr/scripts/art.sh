#!/usr/bin/env bash

#     _    _ _                          _         _
#    / \  | | |__  _   _ _ __ ___      / \   _ __| |_
#   / _ \ | | '_ \| | | | '_ ` _ \    / _ \ | '__| __|
#  / ___ \| | |_) | |_| | | | | | |  / ___ \| |  | |_
# /_/   \_\_|_.__/ \__,_|_| |_| |_| /_/   \_\_|   \__|
#

url=$(playerctl metadata mpris:artUrl 2>/dev/null)
artist=$(playerctl metadata xesam:artist 2>/dev/null)
album=$(playerctl metadata xesam:album 2>/dev/null)

metadata="${artist} - ${album}"

if [ -z "$url" ] || [ "$url" == "No player found" ]; then
    exit
fi

# Sanitize filename (remove problematic chars)
safe_metadata=$(echo "$metadata" | tr -cd '[:alnum:]._-' | tr ' ' '_')

# Ensure cache directory exists
mkdir -p "/home/theblack/.cache/albumart"
temp_path="/home/theblack/.cache/albumart/${safe_metadata}.tmp"
cache_path="/home/theblack/.cache/albumart/${safe_metadata}.png"

# Use cached file if exists
if [ -f "$cache_path" ]; then
    echo "$cache_path"
else
    curl -s "$url" -o "$temp_path"
 
    # Convert to PNG
    magick "$temp_path" -resize 256x256\! "$cache_path"
 
    # Remove temporary file
    rm -f "$temp_path"

    echo "$cache_path"
fi
