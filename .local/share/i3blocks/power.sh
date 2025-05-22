#!/bin/bash

TITLE=${1:-"BAT"}
DEFAULT=$(upower -e | head -n 1)
OBJ="/org/freedesktop/UPower/devices/${BLOCK_INSTANCE:-$DEFAULT}"
STATE=$(upower -i "$OBJ" | grep 'battery-level' | cut -c 26-)

case "${STATE,,}" in
'normal' | 'full')
  STATE='OK'
  ;;
'low')
  STATE='LOW'
  ;;
*)
  STATE='UNK'
  ;;
esac

# Full and short texts
echo "$TITLE $STATE"
echo "$TITLE $STATE"

# Set urgent flag below 5% or use orange below 20%
[ $STATE = "LOW" ] && echo "#FF8000"
[ $STATE = "UNK" ] && echo "#808080"
# ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
