#!/usr/bin/env bash

toggle_theme() {
    local files=("$@")
    local light_mode="$HOME/.light_mode"

    if [ -f "$light_mode" ]; then
        # Switch to dark mode
        for path in "${files[@]}"; do
            if [ -f "$path.dark" ]; then
                echo "Toggling $path to dark mode"
                mv "$path" "$path.light"
                mv "$path.dark" "$path"
            else
                echo "Skipping $path (missing .light variant)"
            fi
        done
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
        rm "$light_mode"
    else
        # Switch to light mode
        for path in "${files[@]}"; do
            if [ -f "$path.light" ]; then
                echo "Toggling $path to light mode"
                mv "$path" "$path.dark"
                mv "$path.light" "$path"
            else
                echo "Skipping $path (missing .dark variant)"
            fi
        done
        gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
        touch "$light_mode"
    fi

    hyprctl reload
}

get_status() {
  local light_mode="$HOME/.light_mode"

  if [ -f "$light_mode" ]; then
    echo '{"text": " ", "tooltip": "Switch to dark mode"}'
  else
    echo '{"text": " ", "tooltip": "Switch to light mode"}'
  fi
}

if [ "$1" == "status" ]; then
  get_status
else
  toggle_theme ~/.config/alacritty/alacritty.toml ~/.config/waybar/style.css ~/.config/albert/config ~/.config/wofi/style.css ~/.config/hypr/colors.conf
  pkill albert; albert &
  set-wallpaper.sh
fi
