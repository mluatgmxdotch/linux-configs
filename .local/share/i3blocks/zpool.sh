#!/bin/bash

TITLE=${1:-"ZPOOL"}
DEFAULT="rpool"
POOL="${BLOCK_INSTANCE:-$DEFAULT}"
POOL_DETAILS=$(zfs list -H -o name,used,available -t all $POOL)

USED=$(echo $POOL_DETAILS | cut -d ' ' -f2)
AVAIL=$(echo $POOL_DETAILS | cut -d ' ' -f3)

USED_BYTES=$(numfmt --from=iec "$USED")
AVAIL_BYTES=$(numfmt --from=iec "$AVAIL")

PERC=$((100 - 100 * $USED_BYTES / $AVAIL_BYTES))

# Full and short texts
echo "$TITLE $AVAIL"
echo "$TITLE $AVAIL"

# Set urgent flag below 5% or use orange below 20%
[ $PERC -le 20 ] && echo "#FF8000"
[ $PERC -le 5 ] && exit 33
# ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
