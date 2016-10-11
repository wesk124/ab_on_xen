#!/bin/bash

# Author: Sheng Wei

# Prepare install apache2 in each vm;
# firstly, the user needs to change the
# install script to set up how many virtual
# machine he/she is going to use.

PREFIX=vm;
NUM_OF_VMS=4;
IP_BASE="10.0.0."
IP_START=5;

echo "===> Installing the apache files to each vm..."
 ./ssh-control/install-cp/install.sh

wait

echo "=====Finish installaition.======"
echo "===> Start running apache server on each vm..."
./ssh-control/run_cmds.sh $PREFIX 0 $((NUM_OF_VMS-1)) "sudo /etc/init.d/apache2 start" &


wait 

echo "===== Finish servers setup.====="

echo "====> Run apache benchmark on dom0..."


for i in `seq 0 $((NUM_OF_VMS-1))`; do
	ab -n 10000 -c 50  "http://"$IP_BASE$((IP_START+$i))"/" > $PREFIX"$i".dat &
done
wait

echo "=====Finish apache benchmark, plz check datas"












