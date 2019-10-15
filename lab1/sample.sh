#!bin/bash

var1=$(grep -i '11/Oct/2006' log.txt |  awk -F '" "' '{print $2}' | cut -d '(' -f 1  | sort | uniq -c | sort -nr -k 1 | sed 's/"//g' | awk '{sum+=$1}END{print sum}')

red=$(grep -i '11/Oct/2006' log.txt |  awk -F '" "' '{print $2}' | cut -d '(' -f 1  | sort | uniq -c | sort -nr -k 1 | sed 's/"//g' | awk -v x=$var1 '{printf "%s - %.0f - %0.1f%%\n", $2, $1, $1/x*100}' | head -n $1)

echo "$red"








