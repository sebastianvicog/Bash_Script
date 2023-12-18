#!/bin/bash

# Autor: Sebastian Vico
# Descripcion: script que recibe una lista de nombres de archivos y calcula el tamaño total.
# Sólo suma si es un fichero ordinario. Al final devuelve por pantalla el numero de ficheros ordinarios y el 
# tamaño total

# DOY POR HECHO QUE EL TAMAÑO ES EN BYTES

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

