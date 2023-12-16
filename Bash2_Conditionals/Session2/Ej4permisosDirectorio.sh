#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 8.4
#Shell que reciba exactamente un argumento que es el nombre de un directorio. A continuacion
# compruebe si ya existe, y si no existe lo cree. Por ultimo, tanto si existia previamente como si no, que le 
# de permisos drwx------

# Comprobar si se ha proporcionado exactamente 1 argumento
if [ "${#}" -ne 1 ]
then
	echo "Debe pasar un solo argumento, usted ha pasado "${#}" argumentos"
	exit
fi
	
# Si no existe el directorio
if [ ! -d "${1}" ]	
then
	# Crear el directorio y asignar permisos drwx------
	mkdir "${1}"
	chmod 700 "${1}"
	echo "El directorio se ha creado con los permisos correspondientes."
# Si existe el directorio
else 
	# Asignar permisos drwx------
	chmod 700 "${1}" 
	echo "Se han asignado los permisos correspondientes al directorio."
fi

