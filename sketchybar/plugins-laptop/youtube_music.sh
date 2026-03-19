#!/usr/bin/env zsh

MAX_LENGTH=40
STATE_FILE="/tmp/yt_music_state"
LAST_TRACK_FILE="/tmp/yt_music_last_track"

PLAY_ICON="󰐊"
PAUSE_ICON="󰏤"
YT_ICON="󰗃"

get_tab_title() {
  osascript 2>/dev/null <<'ASEOF'
    tell application "Google Chrome"
      repeat with w in (every window)
        repeat with t in (every tab of w)
          if URL of t contains "music.youtube.com" then
            return title of t
          end if
        end repeat
      end repeat
    end tell
ASEOF
}

update_track() {
  TAB_TITLE=$(get_tab_title)

  if [[ -z "$TAB_TITLE" ]]; then
    # No YT Music tab — clear state and show grey icon
    rm -f "$STATE_FILE" "$LAST_TRACK_FILE"
    sketchybar --animate ease_out 20 --set $NAME \
      icon="$YT_ICON" icon.color=0xff6c7086 label.drawing=no
    return
  fi

  DISPLAY="${TAB_TITLE% | YouTube Music}"
  DISPLAY="${DISPLAY% \[*}"
  if [ ${#DISPLAY} -gt $MAX_LENGTH ]; then
    DISPLAY="${DISPLAY:0:$((MAX_LENGTH - 1))}…"
  fi

  LAST_TRACK=$(cat "$LAST_TRACK_FILE" 2>/dev/null)
  if [[ "$DISPLAY" != "$LAST_TRACK" ]]; then
    # Track changed — new song auto-plays, reset to playing
    echo "$DISPLAY" > "$LAST_TRACK_FILE"
    echo "playing" > "$STATE_FILE"
  fi

  STATE=$(cat "$STATE_FILE" 2>/dev/null)

  if [[ "$STATE" == "paused" ]]; then
    sketchybar --animate ease_out 20 --set $NAME \
      icon="$PAUSE_ICON" icon.color=0xffeed49f label="$DISPLAY" label.drawing=yes
  else
    sketchybar --animate ease_out 20 --set $NAME \
      icon="$PLAY_ICON" icon.color=0xffed8796 label="$DISPLAY" label.drawing=yes
  fi
}

case "$SENDER" in
"mouse.clicked")
  STATE=$(cat "$STATE_FILE" 2>/dev/null)
  if [[ "$STATE" == "paused" ]]; then
    echo "playing" > "$STATE_FILE"
  else
    echo "paused" > "$STATE_FILE"
  fi
  nowplaying-cli togglePlayPause 2>/dev/null
  update_track
  ;;
*)
  update_track
  ;;
esac
