#!/bin/bash

# Function to send a notification
send_notification() {
    swaync -r 1234 --title "Volume" --message "$1" --icon "audio-volume-high"
}

# Get the current volume level
get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//'
}

# Initialize volume level
current_volume=$(get_volume)

# Send the initial notification
send_notification "$current_volume%"

# Volume adjustment loop
while true; do
    # Show volume slider notification with current volume
    new_volume=$(swaync -r 1234 --title "Volume" --message "$current_volume%" --icon "audio-volume-high" --action "volume-adjust" --volume "$current_volume" --slider --min 0 --max 100 --step 5)

    # Exit if no new volume selected
    if [[ -z "$new_volume" ]]; then
        break
    fi

    # Set the new volume using pactl
    pactl set-sink-volume @DEFAULT_SINK@ "$new_volume%"

    # Update the current volume
    current_volume=$(get_volume)

    # Send the updated notification
    send_notification "$current_volume%"
done

