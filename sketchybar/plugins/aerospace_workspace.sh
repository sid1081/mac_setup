#!/usr/bin/env zsh

FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused 2>/dev/null | tr -d '\n')}"

sketchybar --set aerospace_workspace label="$FOCUSED"
