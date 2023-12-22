#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Make a script that receive a number, (user's UID) and check if this exits in the system.
#			   If it's exist check if this users have the same UID and GID.

if [ ${#} -eq 1 ]
then
	if [[ ${1} =~ ^[0-9]+$  ]]
	then
		while read linea
		do
			uid=$(echo ${linea} | cut -d: -f3)
			if [[ ${uid} == ${1} ]]
			then
				echo "${uid} existe en el sistema" 
				
				gid=$(echo ${linea} | cut -d: -f4)
				if [[ ${uid} == ${gid} ]]
				then
					echo "El usuario tiene el mismo UID y GID"
				fi
			fi
				
		done < /etc/passwd
	else
		echo "Error. El argumento debe de ser un numero"
	fi
else
	echo "Error. EL numero de parametros debe ser uno"
fi
