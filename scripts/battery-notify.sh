#!/bin/bash
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$battery_status" = "Discharging" ]; then
    if [ "$battery_level" -le 5 ]; then
        # Critical: Red icon + urgent
        notify-send -u critical -a "System" -i "battery-empty" "Battery Critical" "Level: ${battery_level}%! Plug in now."
    elif [ "$battery_level" -le 20 ]; then
        # Warning: Purple/Yellow icon + normal
        notify-send -u normal -a "System" -i "battery-low" "Battery Low" "Level: ${battery_level}%"
    fi
fi
