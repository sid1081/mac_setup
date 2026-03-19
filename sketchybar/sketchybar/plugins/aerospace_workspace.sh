#!/usr/bin/env zsh

# Called by sketchybar when aerospace_workspace_change fires.
# FOCUSED_WORKSPACE is passed as an env var by AeroSpace.

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null | tr -d '\n')}"

# Get all non-empty workspaces
ALL=$(aerospace list-workspaces --monitor all --empty no 2>/dev/null | sort -n | tr '\n' ' ')

LABEL=""
for ws in ${=ALL}; do
  if [[ "$ws" == "$FOCUSED" ]]; then
    LABEL="${LABEL}  ${ws}"   # filled dot + number for active
  else
    LABEL="${LABEL}  ${ws}"   # dimmer dot for inactive
  fi
done

sketchybar --set aerospace_workspace label="${LABEL## }" \
    icon.drawing=off
