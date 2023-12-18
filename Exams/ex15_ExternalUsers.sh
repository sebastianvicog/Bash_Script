#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Write a Shell Script without arguments that analize /etc/passwd file and screen users that do not are of system, which base directory do not are in /home.

while read line
do
	uid=$( echo ${line} | cut -d: -f3 )
	baseDir=$( ls /home )
	if [ ${uid} -ge 1000 ]
	then
		user=$( echo ${line} | cut -d: -f1 )
		
		for i in "${baseDir}"
		do
			if [[ ${user} == ${i}  ]]
			then
				echo "${user} exits in /home"
			else
				echo "${user} do not exits in /home but exits in system"
			fi
		done
	fi
done < /etc/passwd

