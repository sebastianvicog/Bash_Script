#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Se pasan 3 argumentos: - Un directorio
#				      - Una extension (.jpg, .png)
#				      - Un numero
# Mostrar los num ficheros que mas ocupan con esa extension. Utiliza la opcion que muestra el espacio en Bytes, 
# kilbytes, megabyte, gigabyte, terabyte and pentabyte. 
# EL script debe comprobar el numero de argumentos, que el primero es un directorio, el segundo un string que 
# empieza por "." y que el tercero es un numero.

if [ ${#} -eq 3 ]
then
	if [ -d ${1} ] && [ -r ${1} ]
	then
		#El segundo argumento debe ser un string que empiece por "."
		if [[ ${2} = "."* ]]
		then
			if [[ ${3} =~ ^[0-9]+$ ]]
			then
				# du -ha para verificar el espacio con formato legible de todos los archivos. 
				# grep para hacer la busqueda de los elementos 
				# sort -hr para ordenar por tamaño y en orden inverso (de mayor a menor)
				# head -n para mostrar el numero de lineas pasadas por la cabecera
				du -ha ${1} | grep ${2}	| sort -nr | head -n ${3}
			
			else
				"EL tercer argumento debe ser un numero"
			fi
		else
			echo "El segundo argumento debe ser un string que empiece por ".""
		fi
	else
		echo "EL primer argumento debe de ser un directorio y tener permiso de lectura."
	fi
else
	echo "El numero de argumentos debe de ser 3."
fi

				    
