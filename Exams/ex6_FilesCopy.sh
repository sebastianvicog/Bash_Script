#!/bin/bash

# Author: Sebastián Vico GUzmán
# Description: Script that recives two or more directories. The first one is destiny directory and the following n directories are otigins directories. 
# The script must copy all files from origins directories into destiny directory if its do not exists yet.
# At the end screen copied elements number.

# Verify arguments number
if [ ${#} -ge 2  ]
then
	for i in $*
	do
		if [[ ! -d ${i} ]] 
		then
			echo "Error. All parameters must be directories"
			exit
		fi
	done
	
	counter=0
	
	for i in $*
	do
		if [[ ${i} != ${1} ]]
		then 
			for j in $(ls ${i})
			do
				flag=0 #do not exits
				for k in $(ls ${1})
				do
					if [[ ${k} == ${j}  ]]
					then
						flag=1
					fi
				done
				
				if [ ${flag} -eq 0 ]
				then
					cp ~/bin/${i}/${j} ~/bin/${1}
					counter=$(( ${counter} + 1 ))
				fi
			done
		fi
	done
echo "Copied elements number: ${counter}"
	
else
	echo "Error. Required parameters minimun number is two."
fi
