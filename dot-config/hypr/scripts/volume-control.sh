#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Volume & Mic control script using wpctl (PipeWire)

iconsDir="$HOME/.config/swaync/icons"
sDIR="."

# --- Get current volume ---
get_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $1*100}')
    muted=$(wpctl get-mute @DEFAULT_AUDIO_SINK@)

    if [[ "$muted" == "true" || "$volume" -eq 0 ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi
}

# --- Get volume icon ---
get_icon() {
    current=$(get_volume)
    if [[ "$current" == "Muted" ]]; then
        echo "$iconsDir/volume-mute.png"
    elif [[ "${current%\%}" -le 30 ]]; then
        echo "$iconsDir/volume-low.png"
    elif [[ "${current%\%}" -le 60 ]]; then
        echo "$iconsDir/volume-mid.png"
    else
        echo "$iconsDir/volume-high.png"
    fi
}

# --- Notify user about volume ---
notify_user() {
    current=$(get_volume)
    icon=$(get_icon)
    
    if [[ "$current" == "Muted" ]]; then
        notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low -i "$icon" "Volume: Muted"
    else
        notify-send -e -h int:value:"${current%\%}" -h string:x-canonical-private-synchronous:volume_notif -u low -i "$icon" "Volume: $current"
        "$sDIR/Sounds.sh" --volume
    fi
}

# --- Volume control ---
inc_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    notify_user
}

dec_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    notify_user
}

toggle_mute() {
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    notify_user
}

# --- Microphone control ---
get_mic_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{printf "%d", $1*100}')
    if [[ "$volume" -eq 0 || $(wpctl get-mute @DEFAULT_AUDIO_SOURCE@) == "true" ]]; then
        echo "Muted"
    else
        echo "$volume%"
    fi
}

get_mic_icon() {
    if [[ $(wpctl get-mute @DEFAULT_AUDIO_SOURCE@) == "true" || $(get_mic_volume) == "Muted" ]]; then
        echo "$iconsDir/microphone-mute.png"
    else
        echo "$iconsDir/microphone.png"
    fi
}

notify_mic_user() {
    volume=$(get_mic_volume)
    icon=$(get_mic_icon)
    notify-send -e -h int:value:"${volume%\%}" -h string:x-canonical-private-synchronous:volume_notif -u low -i "$icon" "Mic-Level: $volume"
}

toggle_mic() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
    notify_mic_user
}

inc_mic_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ +0.05
    notify_mic_user
}

dec_mic_volume() {
    wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 0
    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ -0.05
    notify_mic_user
}

# --- Main ---
case "$1" in
    --get) get_volume ;;
    --inc) inc_volume ;;
    --dec) dec_volume ;;
    --toggle) toggle_mute ;;
    --toggle-mic) toggle_mic ;;
    --get-icon) get_icon ;;
    --get-mic-icon) get_mic_icon ;;
    --mic-inc) inc_mic_volume ;;
    --mic-dec) dec_mic_volume ;;
    *) get_volume ;;
esac
