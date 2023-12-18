#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Script that recives one or more command and screen if they exist or not.
#	       If they exist it  shows their location.

if [ ${#} -ge 1 ]
then
	for command in ${*}
	do
		if [ -e "/bin/${command}"  ]
		then
			location=$( whereis ${command} | cut -d" " -f2 )
			echo "${command} exist in ${location}"
		else 
			echo "${command} does not exist"
		fi
	done
else
	echo "Error. Requiered arguments minimun number: 1" 
fi
