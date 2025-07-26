#!/usr/bin/env bash

light_mode="$HOME/.light_mode"

if [ -f "$light_mode" ]; then
  swaybg -i ~/Pictures/Wallpapers/DOiX52.png &
else
  swaybg -i ~/Pictures/Wallpapers/bkz6luw0jc9f1.png &
fi

