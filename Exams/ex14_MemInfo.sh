#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: /proc/meminfo file has revelant information about system memory in a determinate moment. List its contents with cat /proc/meminfo, study it and write an script that says how much memory in megabytes has buffers and pages tables in a determinate moment.

while read line
do
	title=$( echo ${line} | cut -d: -f1 )
	if [[ ${title} == "Buffers" ]] || [[ ${title} == "PageTables" ]]
	then
		var1=$( echo "${line}" | cut -d: -f1 )	
		var2=$( echo "${line}" | cut -d: -f2 | tr -cd '0-9' )	
		var2_mb=$(( ${var2} / 1024 ))

		echo "${var1}: ${var2_mb} MB"
		
	fi
done < /proc/meminfo

