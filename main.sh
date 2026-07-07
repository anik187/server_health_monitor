#!/usr/bin/env bash

set -euo pipefail

echo "############## memory usage of the system ##############"

free -h | awk -F" " '{if(NR==1) $1="",$2="total",$3="used",$4="free"; print $1,$2,$3,$4}' 

echo
echo "############## disk space info for mounted filesystems ##############"
echo

df -h | awk -F " " '$1 ~ /^\/dev\/sd*/ || NR == 1 {print $0}'

