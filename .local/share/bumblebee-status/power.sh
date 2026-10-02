#!/bin/bash
# Usage: power.sh <model> [title]
#   part of the model as shown by upower -i (case insensitive), the device
#   names like battery_hidpp_battery_0 change order between boots and the
#   device type is not unique (keyboards with touchpad report as mouse)

MODEL=${1:-"mouse"}
TITLE=${2:-"BAT"}

STATE=""
for OBJ in $(upower -e); do
  INFO=$(upower -i "$OBJ")
  if grep -iq "^\s*model:.*${MODEL}" <<<"$INFO"; then
    STATE=$(grep 'battery-level' <<<"$INFO" | awk '{print $2}')
    break
  fi
done

case "${STATE,,}" in
'normal' | 'full' | 'high')
  STATE='OK'
  ;;
'low' | 'critical')
  STATE='LOW'
  ;;
*)
  STATE='UNK'
  ;;
esac

printf "%s" "$TITLE $STATE"
