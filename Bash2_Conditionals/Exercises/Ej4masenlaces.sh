#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Pasar 2 argumentos: - Un directorio
#				   - Un numero
# Esta orden muestra los n ficheros o directorios con mas enlaces duros de ese directorio. El script debe 
# comprobar el numero de argumentos, que el primero es un directorio y el segundo un numero.

if [ ${#} -eq 2 ]
then
	if [ -d ${1} ] && [ -r ${1} ]
	then
		if [[ ${2} =~ ^[0-9]+$ ]]
		then
			# find: Busca en el directorio proporcionado, tanto ficheros como directorios.
				# %n: Enlaces duros 
				# %p: Ruta del archivo
			# sort: Ordena de acuerdo a su valor numerico y en orden descendente
			# head: Mostrar los n ficheros o directorios
			find ${1} -type f -o -type d  -printf "%n %p\n"| sort -nr | head -n ${2}
		else
			echo "EL segundo argumento debe ser un numero."
		fi
	else
		echo "El primer argumento debe ser un directorio con permiso de lectura."
	fi
else
	echo "El numero de argumentos debe ser 2."
fi
