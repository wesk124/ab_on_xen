# Apache on Xen

## Description

Apache Benchmark on Xen is a experiment focuses on performance of Apache servers building Xen guests. In this experiment, we will use Apache Benchmark (ab) to test the performance of each server. This script also uses the pv-deploy-config.mk to configure. Please make changes in that configuration files if needed.

## Installation
The user need to deploy the vm(s) on Xen first then start these vm(s).

## Usage

After delpoying the vms, the user can launch these script:

```
./prepare
```
After installation and benchmark, user can get the 
average and standard deviation of data.
```
./calculate.sh
```
## History

ver.10-10-2016: create this git repo
ver.10-12-2016: fix buges and update  

## TODO
When the number of requests is to large, the time 
out error will occur.




