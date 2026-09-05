#!/usr/bin/env bash

#  ____                               _           _
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
#
# Script for Monitor backlights (if supported) using brightnessctl


iDIR="$HOME/.config/swaync/icons"
notification_timeout=1000

# Get brightness
get_backlight() {
	echo "$(brightnessctl -m | cut -d, -f4 | tr -d '%')"
}

# Get icons
get_icon() {
	current=$(get_backlight)
	if (( current % 10 == 0)); then
		icon="$iDIR/brightness-1.png"
	else
		icon="$iDIR/brightness-2.png"
	fi
}

# Notify
notify_user() {
	notify-send -e \
		-h string:x-canonical-private-synchronous:brightness_notif \
		-u low \
		-i "$icon" \
		"Brightness : $current%"
}

# Change brightness
change_backlight() {
	brightnessctl set "$1" && get_icon && notify_user
}

# Execute accordingly
case "$1" in
	"--get")
		get_backlight
		;;
	"--inc")
		change_backlight "+5%"
		;;
	"--dec")
		change_backlight "5%-"
		;;
	*)
		get_backlight
		;;
esac
