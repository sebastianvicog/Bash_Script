#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Script that recive a word and screen if it is a palindrome or not. 

if [ ${#} -eq 1 ]
then
	i=$(( ${#1} -1 ))
	
	palindrome=" "
	
	while [ ${i} -ge 0 ]
	do
		palindrome=${palindrome}"${1:${i}:1}"
		i=$(( ${i} - 1 ))
	done
	
	x=$( echo ${1} )
	y=$( echo ${palindrome} )
	
	if [[ "${x}" == "${y}" ]]
	then
		echo "${1} is palindrome"
	fi
else
	echo "Arguments numbers must be one"
fi
