#!/bin/bash

TITLE=${1:-"BAT"}
DEFAULT=$(upower -e | head -n 1)
OBJ="/org/freedesktop/UPower/devices/${BLOCK_INSTANCE:-$DEFAULT}"
STATE=$(upower -i "$OBJ" | grep 'battery-level' | cut -c 26-)

# Full and short texts
echo "$TITLE: $STATE"
echo "$TITLE: $STATE"

# Set urgent flag below 5% or use orange below 20%
[ ${STATE,,} = "low" ] && echo "#FF8000"
# ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
