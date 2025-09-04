#!/bin/bash

case "$SENDER" in
"mouse.clicked")
  # Handle both main apple item click and popup item clicks
  case "$NAME" in
    "apple")
      # Show popup menu with Apple menu options
      sketchybar --set apple popup.drawing=toggle
      ;;
    "apple.about")
      # Open About This Mac dialog with system information
      osascript -e '
        tell application "System Events"
          set systemInfo to do shell script "system_profiler SPHardwareDataType | grep -E \"(Model Name|Model Identifier|Processor|Memory|Serial Number)\" | head -5"
          display dialog "About This Mac\n\n" & systemInfo with title "About This Mac" buttons {"OK"} default button "OK"
        end tell
      '
      sketchybar --set apple popup.drawing=off
      ;;
    "apple.settings")
      open -a "System Preferences" 2>/dev/null || open -a "System Settings" 2>/dev/null
      sketchybar --set apple popup.drawing=off
      ;;
    "apple.lock")
      pmset displaysleepnow
      sketchybar --set apple popup.drawing=off
      ;;
  esac
  ;;
"mouse.entered")
  # Add hover effect for popup items
  case "$NAME" in
    "apple.about"|"apple.settings"|"apple.lock")
      sketchybar --set "$NAME" background.color=0xff1a4a8a
      ;;
  esac
  ;;
"mouse.exited")
  # Remove hover effect for popup items
  case "$NAME" in
    "apple.about"|"apple.settings"|"apple.lock")
      sketchybar --set "$NAME" background.color=$ITEM_BG_COLOR
      ;;
  esac
  ;;
esac 