#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Rename all executable program of ~/bin directory. Add .sh if file do not finish in .sh.

while read file
do
	if [ -f ${file} ] && [ -x ${file} ]
	then
		goodFile=$(echo "${file##*/}")
		if [[ ${goodFile##*.} != sh ]]
		then
			mv ${file} ${file}.sh
		fi
	fi
done < <(find ~/bin -type f) 
