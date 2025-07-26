#!/usr/bin/env bash

# Get current workspace ID
ws_id=$(hyprctl activeworkspace -j | jq .id)

# Get active monitor
active_monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

# Get the name of another monitor (first one that's not the active monitor)
target_monitor=$(hyprctl monitors -j | jq -r --arg am "$active_monitor" '.[] | select(.name != $am) | .name' | head -n 1)

# If a target monitor was found, move the workspace
if [ -n "$target_monitor" ]; then
  hyprctl dispatch moveworkspacetomonitor "$ws_id" "$target_monitor"
else
  echo "No other monitor found."
fi

