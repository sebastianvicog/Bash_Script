#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 8.6.
# Escribe un shell script que reciba como argumento el nombre de un nuevo shell script que se
# quiere escribir y simplifique los pasos de: 
#	1. Comprobar si el nombre del script ya existe
#	2. Escribir el archivo
#	3. Darle permisos de ejecucuoin
#	4. Copiarlo al directorio ~/bin

if [ ${#} -ne 1 ]
then
	echo "ERROR. Solo se puede pasar un parametro."
	exit
fi


# Comprobar si el nombre del script ya existe
if [ -e ${1} ]
then
	echo "ERROR. El archivo ya existe."
	exit
fi

argumento=${1}
# Como se ha pasado un solo argumento y este no existe, lo creo:
touch ${argumento}

# Comprobar si el archivo se ha creado correctamente
if [ ! ${?} -eq 0 ]
then
	echo "ERROR. No se ha creado correctamente el archivo"
	exit
else 
	echo "El archivo se ha creado correctamente"
fi

# Darle permisos de ejecucion
chmod +x ${argumento}

# Comprobar si los permisos se cambiaron correctamente
if [ ${?} -eq 0 ]
then
	echo "Los permisos se han cambiado correctamente"
else
	echo "ERROR. Los permisos no se han cambiado correctamente"
fi


# Copiarlo en el directorio ~/bin
mv ${argumento} ~/bin

# Comprobar si el archivo se movio correctamente
if [ ${?} -eq 0 ]
then
	echo "El archivo se ha movido correctamente."
else
	echo "ERROR. El archivo no se ha movid correctamente"
	exit
fi
