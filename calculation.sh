#!/bin/bash

set -euo pipefail

source pv-deploy-config.mk

POSTFIX=".dat"
TEMP="temp"

echo -n "" > temp$1.dat;
echo -n "" > result$1.csv
for i in `seq $ID $(($1-1))`; do
	cat vm$i.dat | grep "Request" | cut -d " " -f  7 >> "temp$1.dat"
done

 cat temp$1.dat | awk  '{sum += $1; sumsq += ($1 * $1) } END {sqd = sumsq /     NR - (sum / NR)^2; if(sqd < 10^-8) sqd = 0; print  sum / NR " ," sqrt(sqd) }' >> result$1.csv


mkdir data$1 

mv *.dat *.csv ./data$1

echo "please check the result in result.csv"

