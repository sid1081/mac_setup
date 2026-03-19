#!/usr/bin/env zsh

# Initialize volume on startup if INFO is empty
if [ -z "$INFO" ]; then
  INFO=$(osascript -e 'output volume of (get volume settings)')
fi

case ${INFO} in
0)
    ICON=""
    ICON_PADDING_RIGHT=21
    ;;
[0-9])
    ICON=""
    ICON_PADDING_RIGHT=12
    ;;
*)
    ICON=""
    ICON_PADDING_RIGHT=6
    ;;
esac

sketchybar --animate ease_out 20 --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label="$INFO%"
