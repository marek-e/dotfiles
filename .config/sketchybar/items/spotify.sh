#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar --add event spotify_change $SPOTIFY_EVENT \
  --add item spotify e \
  --set spotify \
  icon="$(":spotify:")" \
  icon.y_offset=1 \
  icon.font="$FONT_FACE:Bold:15.0" \
  label.drawing=off \
  scroll_texts=on \
  label.padding_left=3 \
  background.drawing=off \
  script="$PLUGIN_DIR/spotify.sh" \
  --subscribe spotify spotify_change mouse.clicked
