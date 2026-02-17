#!/usr/bin/env bash

#   ____ _ _       _     _     _
#  / ___| (_)_ __ | |__ (_)___| |_
# | |   | | | '_ \| '_ \| / __| __|
# | |___| | | |_) | | | | \__ \ |_
#  \____|_|_| .__/|_| |_|_|___/\__|
#           |_|
#

# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

while true; do
    result=$( cliphist list | rofi -dmenu \
                -kb-custom-1 "Control-Delete" \
                -kb-custom-2 "Alt-Delete" \
                -config ~/.config/rofi/config-cliphist.rasi
    )

    case "$?" in
        1)  # 1 - Escape
            exit
            ;;
        0)  # 0 - Normal enter
            [ -z "$result" ] && continue
            cliphist decode <<< "$result" | wl-copy
            exit
            ;;
        10) # custom keys start at exit code 10
            cliphist delete <<<"$result"
            ;;
        11)
            cliphist wipe
            ;;
    esac
done
