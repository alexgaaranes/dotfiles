#!/bin/bash

# SCRIPT FOR WAYBAR SPOTIFY CONTROLLER

# Get Spotify's playback status
status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" == "Playing" ]; then
    # When Spotify is playing
    title=$(playerctl --player=spotify metadata title)
    artist=$(playerctl --player=spotify metadata artist)

    # Handle Advertisement
    if [ "$title" == "Advertisement" ]; then
	echo -n "{\"text\": \"\", \"class\": \"stopped\"}"
    else
        echo -n "{\"text\": \"  $artist - $title\", \"class\": \"playing\"}"
    fi

elif [ "$status" == "Paused" ]; then
    # When Spotify is paused
    title=$(playerctl --player=spotify metadata title)
    artist=$(playerctl --player=spotify metadata artist)
    echo -n "{\"text\": \"  $artist - $title\", \"class\": \"paused\"}"

else
    # When no song is playing or Spotify is closed
    echo -n "{\"text\": \"\", \"class\": \"stopped\"}"
fi
