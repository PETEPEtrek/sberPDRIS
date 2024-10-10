#!/bin/bash

date=$(date +"%F")
startTime=$(date +"%s")

while :
do 
  read -a memArr <<< "$(cat /proc/meminfo | grep 'MemAvailable')"
  if [[ date -ne $(date +"%F") ]]
  then
	  date=$(date +"%F")
  fi
  if [[ ! -e "$date;$startTime.csv" ]]
  then
  	printf "%-15s %-15s %-15s\n" "Date" "Monitoring Time" "Memory" > "$date;$startTime.csv" 
	printf "%-15s %-15s %-15s\n" "$(date +"%F")" "$(date +"%T")" "${memArr[1]}kB" >> "$date;$startTime.csv"
  else
	printf "%-15s %-15s %-15s\n" "$(date +"%F")" "$(date +"%T")" "${memArr[1]}kB" >> "$date;$startTime.csv"
  fi
  sleep 60
done
