#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: script that receives 3 arguments: a name, an extension and a list of file names 
#			   the script renames all the files in the list to the format name-###.extension where ### starts at 000 and is incrementing 


# Comprobar que el numero de argumentos es de minimo 3
if [ ${#} -ge 3 ]
then
	# Comprobar que el segundo argumento es una extension (empieza con ".")
	if [[ ${2} =~ ^[.] ]]
	then
		contador=0 # No se puede incrementar el 000 (incrementa a 1, no a 001)

		# Recorro los argumentos
		for archivo in ${*}
		do
			# Comprobacion fichero regular
			if [ -f ${archivo} ]
			then
				# Si el numero de ficheros < 10 entonces añadimos 00 delante del cont
				if [ ${contador} -lt 10 ] 
				then
					mv ${archivo} "${1}-00${contador}${2}"
				fi
				
				# Si el numero de ficheros >= 10 y < 100 entonces añadimos 0 delante del cont 
				if [ ${contador} -ge 10 ] && [ ${contador} -lt 100 ] 
				then
					mv ${archivo} "${1}-0${contador}${2}"
				fi
				
				# Si el numero de ficheros >= 100 entonces NO añadimos 0 delante del cont 
				if [ ${contador} -ge 100 ]
				then
					mv ${archivo} "${1}-${contador}${2}"
				fi				
				
				contador=$(( ${contador}+1 )) # Aumentar contador
			fi
				
		done
	else
		echo "El segundo argumento debe ser una extension (.txt, .png, etc)"
	fi
else
	echo "El numero de argumentos debe de ser minimo de 3"
fi


