#!/bin/bash

# Author: Sebastián Vico Guzmán
# Description: script that receives a list of filenames and calculates the total size.
# 			   It only adds up if it is an ordinary file. 
#			   At the end it returns on the screen the number of ordinary files and the total size


# Comprobar que el numero de argumentos es minimo 1
if [ ${#} -ge 1 ]
then
	sumFicheros=0 # Contador del numero de ficheros ordinarios
	sumTam=0 # Contador del tamaño
	
	for archivo in ${*}
	do
		# Comprobar que el argumento es un fichero ordinario
		if [ -f ${archivo} ]
		then
			
			tam=$(du -b ${archivo} | cut -f1) # Tamaño del fichero actual
			sumTam=$(( ${sumTam} + ${tam} )) # Sumatoria del tamaño total
			sumFicheros=$(( ${sumFicheros} + 1 )) # Sumatoria del numero de ficheros ordinarios
		fi
	done
	
	echo "El numero de ficheros ordinarios es: ${sumFicheros}"
	echo "El tamaño total es: ${sumTam}"
	
	
else
	echo "El numero de argumentos debe de ser minimo 1"
fi

