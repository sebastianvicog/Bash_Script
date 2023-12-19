#!/bin/bash

# Autor: Sebastian Vico Guzman
# Descripcion: Script to search all directories hanging from the base directory of the user running the script for files named core.
#              It should delete all found core files. At the end of the script the number of deleted core files should be printed.

while read ruta
do
	archivo=$(echo ${ruta##*/})
	if [[ ${archivo} == "core" ]]
	then
		rm ${archivo}
	fi

done < <(find ~/ -type f -name "core")
