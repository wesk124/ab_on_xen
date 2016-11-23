# Apache on Xen

## Description

Apache Benchmark on Xen is an experiment focuses on performance of Apache servers building Xen guests. In this experiment, we will use Apache Benchmark (ab) to test the performance of each server. This script also uses the pv-deploy-config.mk to configure. Please make changes in that configuration files if needed.

## Installation
The user need to deploy the vm(s) on Xen first then start these vm(s).

## Usage

After delpoying the vms, the user can launch these script:

```
./prepare.sh
```
This script allows you to configure the server on corresponding server
```
./start.sh
```
this is used to launch the experiment, and save the data in vm.dat
```
./calculate.sh
```
this combines all the data and calculate the mean and stdev.
```
```
## History

ver.10-10-2016: create this git repo.

ver.10-12-2016: add deploying config file...

ver.10-21-2016: split prepare, create a new script to run the experiment

## TODO
1. When the number of requests is too large, the time 
out error will occur.
2. The concurrency cannot be too large either.
3.



