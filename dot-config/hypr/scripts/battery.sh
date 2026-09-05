#!/usr/bin/env bash

#  ____
# |  _ \       _   _
# | |_) | __ _| |_| |_ ___ _ __ _   _
# |  _ < / _` | __| __/ _ \ '__| | | |
# | |_) | (_| | |_| ||  __/ |  | |_| |
# |____/ \__,_|\__|\__\___|_|   \__, |
#                               |___/
#

icons=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

# Auto detect battery
BAT=$(command ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)
[[ -z "$BAT" ]] && exit 0

STATUS=$(< $BAT/status)

CAPACITY=$(< $BAT/capacity)
[[ -z $CAPACITY ]] && exit 1

index=$(( CAPACITY / 10 ))
(( index > 9 )) && index=9


if [[ "$STATUS" == "Discharging" ]]; then
    echo "${icons[index]} ${CAPACITY}%"

elif [[ "$STATUS" == "Charging" ]]; then
    echo "󰂄 ${CAPACITY}%"

elif [[ "$STATUS" == "Full" ]]; then
    echo "󰁹 ${CAPACITY}%"

else
    echo " ${CAPACITY}%"

fi
