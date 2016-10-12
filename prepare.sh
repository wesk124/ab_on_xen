#!/bin/bash
set -euxo pipefail

# Author: Sheng Wei
# Modified by Beichen Liu

# Prepare install apache2 in each vm;
# firstly, the user needs to change the
# install script to set up how many virtual
# machine he/she is going to use.

# Last modified on 10/12/2016

source "pv-deploy-config.mk";

IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`

echo "===> Installing the apache files to each vm..."
 ./ssh-control/install-cp/install.sh $PREFIX $ID $((VM_NUM-1)) ab_install.conf

wait

echo "=====Finish installaition.======"
echo "===> Start running apache server on each vm..."
./ssh-control/run_cmds.sh $PREFIX 0 $((VM_NUM-1)) "sudo /etc/init.d/apache2 start" &


wait 

echo "===== Finish servers setup.====="

echo "====> Run apache benchmark on dom0..."


for i in `seq 0 $((VM_NUM-1))`; do
	ab -n 10000 -c 50  "http://"$IP_BASE.$(($BASE_IP_NUM+$i))"/" > $PREFIX"$i".dat &
done
wait

echo "=====Finish apache benchmark, plz check datas"












