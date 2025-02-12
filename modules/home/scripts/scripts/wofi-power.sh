#!/usr/bin/env bash

entries=" Lock\n⇠ Quit\n⏾ Suspend\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 170 --dmenu --hide-search --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  lock)
      exec hyprlock;;
  quit)
      exec hyprctl dispatch exit;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
