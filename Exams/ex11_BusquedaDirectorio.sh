#!/bin/bash

# Autor: Sebastian Vico Guzman
# Descripcion: Script que busque en todos los directorios que cuelgan del directorio base del usuario que ejecuta el script, si hay algun archivo que se llame core y que borre todos los archivos core encontrados. Al final del script se debe imprimir el numero de archivos core borrados.

while read ruta
do
	archivo=$(echo ${ruta##*/})
	if [[ ${archivo} == "core" ]]
	then
		rm ${archivo}
	fi

done < <(find ~/ -type f -name "core")
