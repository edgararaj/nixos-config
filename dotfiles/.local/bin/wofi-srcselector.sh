#!/usr/bin/env bash

wpctl status \
| sed -n '/Sources:/,/Filters:/p' \
| sed 's/[├─│└]//g' \
| awk '/\[vol:/ { print }' \
| sed -E 's/\s*\[vol:.*$//' \
| sed -E 's/^\s*//' \
| wofi -d \
| while read -r choice; do wpctl set-default "$(echo "$choice" | sed -E 's/\*?\s*([0-9]+)\.\s+/\1/')"; done
