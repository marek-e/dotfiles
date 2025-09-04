#!/bin/bash

sketchybar --add item apple left \
  --set apple icon="$APPLE" \
  icon.color=$ACCENT_COLOR \
  icon.padding_left=8 \
  icon.padding_right=8 \
  label.drawing=off \
  background.color=$ITEM_BG_COLOR \
  popup.background.color=$ITEM_BG_COLOR \
  popup.background.corner_radius=8 \
  popup.background.border_width=1 \
  popup.background.border_color=$ACCENT_COLOR \
  script="$PLUGIN_DIR/apple.sh" \
  --subscribe apple mouse.clicked popup.clicked

# Add popup menu items with better styling
# sketchybar --add item apple.about popup.apple \
#   --set apple.about icon="􀣺" \
#   icon.color=$WHITE \
#   label="About This Mac" \
#   label.color=$WHITE \
#   script="$PLUGIN_DIR/apple.sh" \
#   --subscribe apple.about mouse.clicked mouse.entered mouse.exited

sketchybar --add item apple.settings popup.apple \
  --set apple.settings icon="􀺽" \
  icon.color=$WHITE \
  label="System Settings" \
  label.color=$WHITE \
  script="$PLUGIN_DIR/apple.sh" \
  --subscribe apple.settings mouse.clicked mouse.entered mouse.exited

sketchybar --add item apple.lock popup.apple \
  --set apple.lock icon="􀒳" \
  icon.color=$WHITE \
  label="Lock Screen" \
  label.padding_right=32 \
  label.color=$WHITE \
  script="$PLUGIN_DIR/apple.sh" \
  --subscribe apple.lock mouse.clicked mouse.entered mouse.exited
