#!/usr/bin/env bash

DISKUSE=$(df -h / | awk 'NR==2 {print $4}')
CPUUSE=$(cat /proc/loadavg | awk '{print $1}')

for folder in /sys/class/hwmon/hwmon*

do

if [[ -e "$folder/temp1_input"  ]]; then
TEMPCPU=$(sed 's/000$/°C/' "$folder/temp1_input")
fi

done

MEMUSE=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%2.2fG", ( $3 / 1024), ($2 / 1024))}')
DATE=$(date +"%H:%M")

echo " WM:DWM | SSD:$DISKUSE | CPU:$CPUUSE% | TEMP:$TEMPCPU | MEM:$MEMUSE | HORA:$DATE "
