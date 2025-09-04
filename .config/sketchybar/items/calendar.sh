#!/bin/bash

# sketchybar --add item calendar right \
#   --set calendar \
#   icon=􀧞 \
#   icon.color="$BAR_COLOR" \
#   background.color="$ACCENT_COLOR" \
#   background.border_color="$ITEM_BG_COLOR" \
#   background.border_width=3 \
#   label.color="$BAR_COLOR" \
#   update_freq=20 \
#   script="$PLUGIN_DIR/calendar.sh"

sketchybar --add item calendar right \
  --set calendar \
  icon=􀧞 \
  icon.color="$BAR_COLOR" \
  background.color="$ITEM_BG_COLOR" \
  background.border_color="$ACCENT_COLOR" \
  background.border_width=1 \
  label.color="$BAR_COLOR" \
  update_freq=20 \
  script="$PLUGIN_DIR/calendar.sh"