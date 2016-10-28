# VM naming:
# The first vm name will be the concatennation of PREFIX + ID
# ex: PREFIX=vm, ID=0 so the name of the first machine created  will be vm0
# The last vm id will be computed as ID + VM_NUM -1
PREFIX=vm
ID=0

# Directory for vm
XT_DIR=/root/xen-domains

###This part is used to deploy vms

# Number of VM to deploy
VM_NUM=16

# Amount of memory for the VM in MB
MEMORY=1024

# Size of Virtual disk in GB
DISK_SIZE=1

# Number of Vcpu
VCPUS=1

# Networking - the ip will be computed based on GATEWAY (first 3 numbers), and
# BASE_IP_NUM. Fors example if we are creating 3 VMs, GATEWAY=10.0.0.1, and
# BASE_IP_NUM=2, their ip will be 10.0.0.2, 10.0.0.3 and 10.0.0.4
BRIDGE=xenbr0
NETMASK=255.255.255.0
GATEWAY=10.0.0.1
BASE_IP_NUM=2
###



