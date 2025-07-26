#!/usr/bin/env python3

import os

def run_menu():
  keys = (
    "\uf023  Log Out",
    "\uf186  Suspend",
    "\uf2dc  Hibernate",
    "\uf021  Reboot",
    "\uf011  Shutdown",
  )

  actions = (
    "loginctl terminate-user earaujo",
    "systemctl suspend",
    "systemctl hibernate",
    "systemctl reboot",
    "systemctl poweroff"
  )

  options = "\n".join(keys)
  choice = os.popen("echo '" + options + "' | wofi -d -p 'Power Menu'").readline().strip()
  if choice in keys:
    os.popen(actions[keys.index(choice)])

run_menu()
