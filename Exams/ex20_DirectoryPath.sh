#!/bin/bash

# Author: Sebastián Vico GUzmán
# Description: Script that recives one ore more directory paths.
#	       For each argument it check if it is a directory and if it has execute and read files.
#	       If it is rigth, show its content and screen directories's number and file's number.
#	       At the end, write directories's number which have permissions.

if [ ${#} -ge 1 ]
then
	dirCount=0

	
	for dir in ${*}
	do	
		echo "----- Argument: ${dir} ----- "
		
		if [ -d ${dir} ] && [ -x ${dir} ] && [ -r ${file} ]
		then
			dirCount=$(( ${dirCount} + 1 ))
			
			fileCount=0
			noFileCount=0

			for aux in $(ls "${dir}")
			do	
				if [ -f ${aux} ] 
				then
					echo ${aux}
					fileCount=$(( ${fileCount} + 1 ))
				fi
				
				if [ -d ${aux} ]
				then
					echo ${aux}
					noFileCount=$(( ${noFileCount} + 1 ))
				fi
			done
			
			echo "Directories's Number: ${noFileCount}"
			echo "Files's Number: ${fileCount}"
		fi
	done
	
	echo "Directories with execute and read permissions analyzed: ${dirCount}"
else
	echo "Error. Arguments minimum number requiered: 1"
fi

