#!/usr/bin/env bash

set -euo pipefail

echo "############## memory usage of the system ##############"
echo

free -h | awk -F" " '{if(NR==1) {$1="    ";$2="total";$3="used";$4="free";$5="perc(%)" ; print $1,$2,$3,$4,$5}} /Mem:/  {$5=$2;$6=$3; gsub(/[a-zA-Z]/,"",$5); gsub(/[a-zA-Z]/,"",$6) ; if($3 ~ /[0-9]+Mi/) {$6=$6/1000}; print $1,$2,$3,$4,int($6/$5 * 100)}' 

echo
echo "############## disk space info for mounted filesystems ##############"
echo

df -h | awk -F " " '$1 ~ /^\/dev\/sd*/ || NR == 1 {print $0}'

echo
echo "############## top 5 processes as per cpu usage ##############"
echo

ps aux --sort=-cpu | head -n 6 


echo
echo "############## current logged in users ##############"
echo

uptime | awk -F"," '{print $2}'

echo
echo "############## uptime of the machine ##############"
echo

uptime -p


