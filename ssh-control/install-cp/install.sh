#!/bin/bash

# set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_RUN_CMDS=$SCRIPT_DIR/../run_cmds.sh

if [ "$#" -lt 4 ];then
    echo "Usage: $0 <prefix> <start> <stop> <config file>"
    echo "ex: ./install.sh vm 0 1 install"
    exit
fi

if [ ! -e $SCRIPT_RUN_CMDS ] ; then
    echo "Cannot find single vm cmd exec script"
    exit
fi

$SCRIPT_RUN_CMDS $1 $2 $3 apt-get update
$SCRIPT_RUN_CMDS $1 $2 $3 apt-get -f install -y
# $SCRIPT_RUN_CMDS $1 $2 $3 apt-get upgrade -y

while IFS='' read -r line  ; do
        if [ ! "$line" == "" ] || [[ ! "$line" == "\#*" ]]; then
            $SCRIPT_RUN_CMDS $1 $2 $3 apt-get install -y $line 
       fi
done < $4

#TODO
# - deal with comments if exists (check if line stats with #, if true just
#   skip it)
# - deal with empty line: if line == "" just skip it too
