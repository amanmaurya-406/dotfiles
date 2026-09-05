#!/usr/bin/env bash

#  __  __          _ _          ___             _             _
# |  \/  | ___  __| (_) __ _   / __| ___  _ __ | |_ _ __ ___ | |
# | |\/| |/ _ \/ _` | |/ _` | | |   / _ \| '_ \| __| '__/ _ \| |
# | |  | |  __/ (_| | | (_| | | |__| (_) | | | | |_| | | (_) | |
# |_|  |_|\___|\__,_|_|\__,_|  \____\___/|_| |_|\__|_|  \___/|_|
#


music_icon="$HOME/.config/swaync/icons/music.png"


wait_for_new_track_and_notify() {
    sleep 0.01
    local status title artist
    while read -r status; do
        [[ "$status" == "Stopped" ]] && continue

        title=$(playerctl metadata title 2>/dev/null)
        artist=$(playerctl metadata artist 2>/dev/null)
        notify-send -e -u low -i "$music_icon" "Now Playing:" "$title\nby $artist"
        break
    done < <(playerctl --follow status)
}

# Play the next track
play_next() {
    playerctl next
    wait_for_new_track_and_notify
}

# Play the previous track
play_previous() {
    playerctl previous
    wait_for_new_track_and_notify
}

# Toggle play/pause
toggle_play_pause() {
    playerctl play-pause
    sleep 0.01
    status="$(playerctl status)"
    if [[ "$status" == "Paused" ]]; then
        notify-send -e -u low -i "$music_icon" "Playback Paused"
    fi
}

# Stop playback
stop_playback() {
    playerctl stop
    notify-send -e -u low -i "$music_icon" "Playback Stopped"
}


# Get media control action from command line argument
case "$1" in
    "--nxt")
        play_next
        ;;
    "--prv")
        play_previous
        ;;
    "--pause")
        toggle_play_pause
        ;;
    "--stop")
        stop_playback
        ;;
    *)
        echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
        exit 1
        ;;
esac
