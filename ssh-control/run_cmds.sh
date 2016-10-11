#!/bin/bash
set -euo pipefail

if [ "$#" -lt 4 ]; then
	echo "usage: $0 <prefix> <start> <stop> <cmd>"
	exit
fi

for i in `seq $2 $3`; do
	( ssh root@$1$i ${*:4} 2>&1 | sed "s/^/[$1$i] /" ) &
done
wait
