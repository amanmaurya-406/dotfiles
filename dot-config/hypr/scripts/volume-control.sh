#!/usr/bin/env bash

# __     __    _                         ___             _             _
# \ \   / /__ | |_   _ _ __ ___   ___   / __| ___  _ __ | |_ _ __ ___ | |
#  \ \ / / _ \| | | | | '_ ` _ \ / _ \ | |   / _ \| '_ \| __| '__/ _ \| |
#   \ V / (_) | | |_| | | | | | |  __/ | |__| (_) | | | | |_| | | (_) | |
#    \_/ \___/|_|\__,_|_| |_| |_|\___|  \____\___/|_| |_|\__|_|  \___/|_|
#
# Volume & Mic control script using wpctl (PipeWire)

iconsDir="$HOME/.config/swaync/icons"

# --- Get current volume ---
get_volume() {
    volume_info=$(wpctl get-volume "$1")  # e.g., "Volume: 0.78 [MUTED]"

    # Extract numeric volume and convert to percentage
    volume=$(awk '{printf "%.0f", $2*100}' <<< "$volume_info")

    # Check if muted
    status=$(awk '{print $3}' <<< "$volume_info")  # [MUTED] or ''

    if [[ $volume -eq 0 || "$status" == "[MUTED]" ]]; then
        echo "Muted"
    else
        echo "$volume"
    fi
}

# --- Get icon ---
get_icon() {
    current=$(get_volume "$1")
    if [[ "$1" == "@DEFAULT_AUDIO_SINK@" ]]; then
        if [[ "$current" == "Muted" ]]; then
            echo "$iconsDir/volume-mute.png"
        elif [[ "$current" -le 30 ]]; then
            echo "$iconsDir/volume-low.png"
        elif [[ "$current" -le 60 ]]; then
            echo "$iconsDir/volume-mid.png"
        else
            echo "$iconsDir/volume-high.png"
        fi
    elif [[ "$1" == "@DEFAULT_AUDIO_SOURCE@" ]]; then
        if [[ "$current" == "Muted" ]]; then
            echo "$iconsDir/microphone-mute.png"
        else
            echo "$iconsDir/microphone.png"
        fi
    fi
}

# --- Notify user about volume ---
notify() {
    icon=$(get_icon "$1")

    if [[ "$1" == "@DEFAULT_AUDIO_SINK@" ]]; then
        volume_mic="Volume"
    else
        volume_mic="Mic"
    fi

    current=$(get_volume "$1") # Muted or 78

    if [[ "$current" != "Muted" ]]; then
        current+="%" # 78%
    fi

    notify-send \
        -h string:x-canonical-private-synchronous:volume_notif \
        -u low \
        -i "$icon" \
        "$volume_mic: $current"
}

# --- Volume control ---
inc_volume() {
    wpctl set-mute "$1" 0
    wpctl set-volume "$1" 5%+ --limit 1.5
    notify $1
}

dec_volume() {
    wpctl set-mute "$1" 0
    wpctl set-volume "$1" 5%-
    notify $1
}

toggle_mute() {
    wpctl set-mute "$1" toggle
    notify $1
}


# --- Main ---
case "$1" in
    --inc) inc_volume @DEFAULT_AUDIO_SINK@ ;;
    --dec) dec_volume @DEFAULT_AUDIO_SINK@ ;;
    --toggle) toggle_mute @DEFAULT_AUDIO_SINK@ ;;

    --inc-mic) inc_volume @DEFAULT_AUDIO_SOURCE@ ;;
    --dec-mic) dec_volume @DEFAULT_AUDIO_SOURCE@ ;;
    --toggle-mic) toggle_mute @DEFAULT_AUDIO_SOURCE@ ;;

    *) get_volume @DEFAULT_AUDIO_SINK@ ;;
esac
