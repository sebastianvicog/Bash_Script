#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: Unify all files in ~/bin directory for all files to make them end in .sh extension.

while read file
do
	if [ -f ${file} ] && [[ ${file##*.} != "sh" ]]
	then
		mv ${file} ${file}.sh
	fi
done < <(find ~/bin -type f)
