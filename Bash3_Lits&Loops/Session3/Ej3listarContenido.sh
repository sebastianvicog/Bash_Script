#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell script que reciba como argumentos una lista de directorios accesibles desde el directorio 
# de trabajo actual (es decir, que los nombres que se den como argumentos deben ser rutas validas que permitan 
# acceder a esos direcrtoiso desde el directosio de trabajo actual) y que liste el contenido de cada directorio

for directorio in "${@}"
do
	# Comprobar que i no es una ruta absoluta y por tanto se puede acceder desde el directorio actual
	if [[ "${directorio}" = /* ]]
	then
		echo "Error. Proporciona una ruta relativa"
	else
		# Comprueba si el argumento i es un directorio 
		if [ -d "${directorio}" ]
		then
			ls ${directorio}
		else 
			echo "${directorio} no es un directorio accesible desde el directorio actual"
		fi
	fi
done
