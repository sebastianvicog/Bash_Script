#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Escribe un shell que unifique todos los nombres de archivo del directorio ~/bin de forma que 
# todos terminen en .sh

ls ~/bin | while read file
do
	if [ -f ${file} ]
	then
		if [[ ${file} =~ ^[a-zA-Z0-9]+$ ]] && [ ! -e ${file} ]
		then
			mv ${file} "${file}.sh"
		else 
			if [[ ${file} == *.* ]] && [[ ${file} != *.sh ]]
			then
				mv ${file} "${file%.*}.sh"
			fi	
				
		fi
	fi
	
done
