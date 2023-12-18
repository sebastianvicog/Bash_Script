#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Write a shell script that analyzed /etc/group file and determinates if a range of GIDs numbers arguments are valid groups on the system. At the end, it should screen how many groups are valid and how many do not.

validGroupCount=0
invalidGroupCount=0

for i in "${@}"
do
	flag=0 #Invalid group
	
	while read line
	do
		validGroup=$( echo ${line} | cut -d: -f1 )
		
		if [[ "${i}" == "${validGroup}" ]]
		then
			echo "${i} is a valid group"
			flag=1
		fi
		
	done < /etc/group
	
	if [ "${flag}" -eq 1 ]
	then
		validGroupCount=$(( ${validGroupCount} + 1 ))
	else 
		invalidGroupCount=$(( ${invalidGroupCount} + 1 ))
	fi
		
done
echo -e "\nValid groups's total number: ${validGroupCount}"
echo "Invalid groups's total number: ${invalidGroupCount}"
		

