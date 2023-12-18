#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Write a shell script that analizes ~/bin files and informs if there are files whose read or write permissions are enable for group and other users.


echo "Read or write permissions for group and other are enable for: " 

for i in ~/bin/*
do
	file=$(ls -d -l "${i##*/}" | grep -v total )
	
	# Read or write permissions for groups
	if [[ ${file:4:1} == "r" ]] || [[ ${file:5:1} == "w" ]] 
	then
		# Read or write permissions for other users
		if [[ ${file:7:1} == "r" ]] || [[ ${file:8:1} == "w" ]]
		then
			echo | ls -l "${i}" | grep -v total 
		fi
	fi


done

