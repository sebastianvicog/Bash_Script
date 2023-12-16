#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Recibe como argumento un numero, el UID de un usuario y que comprueba si existe en el 
# sistema un usuario con ese UID. Si existe debe comprobar ademas si ese usuario tiene el mismo UID y GID

# Comprobar el numero de argumentos
if [ "${#}" -eq 1 ]
then
		
	# Comprobar si el argumento es un numero
	if [[ "${1}" =~ ^[0-9]+$ ]]
	then
		# Recorrer el archivo /etc/passwd
		while read linea
		do
			uid=$( echo ${linea} | cut -d: -f3 ) # Quiero ir comparando con el dato 4 (GID)
			
			# Comprobacion de si son iguales
			if [ "${1}" -eq "${uid}" ]
			then
				echo "${uid} existe en el sistema"
				
				# Comprobar si tiene el mismo UID y GID
				if [ "${uid}" -eq "$( echo ${linea} | cut -d: -f4 )"  ]
				then
					echo "Tienen el mismo UID y GID"
					exit
				else
					echo "No tienen el mismo UID y GID"
					exit
				fi
			fi
		done < /etc/passwd
		
		echo "El grupo ${1} no existe en el sistema"
	
		
	else
		echo "El argumento debe de ser un numero"
	fi
		
else
	echo "EL numero de argumentos debe de ser 1."
fi
