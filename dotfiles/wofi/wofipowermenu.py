#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os

def run_menu():
  keys = (
    "\uf023   Log Out",
    "\uf186   Suspend",
    "\uf2dc   Hibernate",
    "\uf021   Reboot",
    "\uf011   Shutdown",
  )

  actions = (
    "loginctl terminate-user earaujo",
    "systemctl suspend",
    "systemctl hibernate",
    "systemctl reboot",
    "systemctl shutdown"
  )

  options = "\n".join(keys)
  choice = os.popen("echo '" + options + "' | wofi -L " + str(len(keys) + 2) + " -d -i -p 'Power Menu' -W 200 -H 175 -k /dev/null").readline().strip()
  if choice in keys:
    os.popen(actions[keys.index(choice)])

run_menu()
