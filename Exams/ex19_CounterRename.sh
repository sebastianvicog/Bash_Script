#!/bin/bash

# Author: Sebastián Vico GUzmán
# Description: There are some shell script in ~/bin directory. Write a shell script that rename files using the following name: name.###.sh where name is file name without extension, ### is a sequential number starting at 000 that is increased for each new file that renamed.

counter=0

for i in ~/bin/*
do
	file=$( echo ${i##*/} )
	fileReady=$( echo ${file%%.*} )
	
	if [ ${counter} -lt 10 ]
	then
		mv ${i} ${fileReady}.00${counter}.sh
		counter=$(( ${counter} + 1 ))
	else 
		if [ ${counter} -ge 10 ] && [ ${counter} -lt 100 ]
		then
			mv ${i} ${fileReady}.0${counter}.sh
			counter=$(( ${counter} + 1 ))
		else
			if [ ${counter} -ge 100 ]
			then
				mv ${i} ${fileReady}.${counter}.sh
				counter=$(( ${counter} + 1 ))
			fi
		fi
		
	fi
done
