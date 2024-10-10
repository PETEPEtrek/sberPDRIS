#!/bin/bash

while :
do 
  read -a memArr <<< "$(cat /proc/meminfo | grep 'MemAvailable')"
  pidNUM=$(cat "PID.txt")
  echo "$(date +"%F") $(date +"%T") ${memArr[1]}kB" >> "log${pidNUM}.csv"
  sleep 86400
done
