#!/bin/bash

# SCRIPT FOR GETTING BAT LEVEL

# Get the current battery percentage
battery_percentage=$(cat /sys/class/hwmon/hwmon2/device/capacity)

# Get the battery status (Charging or Discharging)
battery_status=$(cat /sys/class/hwmon/hwmon2/device/status)

# Define the battery icons for each 10% segment
battery_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹")

# Define the charging icon
charging_icon="󰂄"

# Calculate the index for the icon array
icon_index=$((battery_percentage / 11))

# Get the corresponding icon
battery_icon=${battery_icons[icon_index]}

# Check if the battery is charging
if [ "$battery_status" = "Charging" ]; then
	battery_icon="$charging_icon"
fi

# Output the battery percentage and icon
echo "$battery_percentage%   $battery_icon"
