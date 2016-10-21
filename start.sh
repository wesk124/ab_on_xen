#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {

    printf "function test\n";
    printf "Running $VM_NUM server(s) benchmark will start in 3 secs...\n"
#    mkdir "data"$VM_NUM

    for i in `seq 0 $((VM_NUM-1))`; do 
        touch $PREFIX$i.dat;
        ab -n 10000 -c 50  "http://"$IP_BASE$(($BASE_IP_NUM+$i))"/" >> $PREFIX$i.dat &
    done
    wait
}

echo "start experiment..."
rm -r data* || true     # remove previous data
rm result*.csv || true  # remove previous calculation
rm vm*.dat
wait
echo "old data cleaned"

# while true; do
    run_apache;
# done
