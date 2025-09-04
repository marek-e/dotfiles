#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
COLOR="0xFFE10019"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
9[0-9] | 100)
  ICON="􀛨"
  COLOR="0xFFF9E776"
  ;;
[6-8][0-9])
  ICON="􀺸"
  COLOR="0xFFFFF184"
  ;;
[3-5][0-9])
  ICON="􀺶"
  COLOR="0xFFFFF8B1"
  ;;
[1-2][0-9])
  ICON="􀛩"
  COLOR="0xFFFFFCE6"
  ;;
*) ICON="􀛪" COLOR="0xFFFFFCE6" ;;
esac

if [[ "$CHARGING" != "" ]]; then
  ICON="􀢋"
  COLOR="0xff32cd32" #32cd32
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color="$COLOR"
