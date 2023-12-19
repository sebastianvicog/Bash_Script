#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Write a script that receives a symbolic link and displays
#				its absolute path on the screen

if [ ${#} -eq 1 ]
then
	if [ -h ${1} ]
	then
		for ruta in $( find / -name ${1} )
		do
			echo -e "\n- ${ruta%/*}"
		done
	else
		echo "Error. The argument must be a symbolic link"
	fi
else
	echo "Error. Argument's number must be one"
fi
