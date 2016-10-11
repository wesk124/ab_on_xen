#!/bin/bash

set -euo pipefail

if [ ! "$#" = "4" ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    exit
fi

while IFS='' read -r line; do
    echo $line
    source=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\1/p"`
    target=`echo $line | sed -n "s/\(.*\)\;\(.*\)/\2/p"`
   
    for i in `seq $2 $3`; do
       ( scp  $source "root@$1$i:"$target ) &
    done
done < $4
wait
