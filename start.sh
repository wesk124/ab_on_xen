#!/bin/bash
set -euo pipefail

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.

function run_apache {
    printf "please enter how many server you want for this run:\n";
    read numOfServers;
    if [ $numOfServers -gt $VM_NUM ]; then
        echo "number of servers cannot be greater than number of vm"
        exit
    fi

    printf "function test\n";
    printf "Running $numOfServers server(s) benchmark will start in 3 secs...\n"


    for i in `seq 0 $((numOfServers-1))`; do 
        touch $PREFIX$i.dat;
        ab -n 2500 -c 50  "http://"$IP_BASE$(($BASE_IP_NUM+$i))"/" >> $PREFIX$i.dat  &
    done
    wait
}

echo "start experiment..."
rm result*.csv || true  # remove previous calculation
rm vm*.dat  ||true
wait
echo "old data cleaned"

# while true; do
    run_apache;
# done
