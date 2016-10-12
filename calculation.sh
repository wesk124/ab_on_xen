#!/bin/bash

set -euo pipefail

source pv-deploy-config.mk

POSTFIX=".dat"
TEMP="temp"

echo -n "" > temp.dat;
echo -n "" > result.csv
for i in `seq $ID $((VM_NUM-1))`; do
	cat vm$i.dat | grep "Request" | cut -d " " -f  7 >> "temp.dat"
done

 cat temp.dat | awk  '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq /     NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print "number of requests per sec" ", "sum / NR ", "     sqrt(sqd)}' >> result.csv

echo "please check the result in result.csv"

