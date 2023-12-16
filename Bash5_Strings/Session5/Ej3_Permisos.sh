#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Analizar los archivos del directorio ~/bin e informe si hay archivos cuyos permisos de lectura o
# escritura esten activados para el grupo y otros usuarios

if [ -d ~/bin ]
then
	ls -l ~/bin | while IFS=" " read -r permisos num usu usu2 num2 mes num2 hora nombre 
	do
		if [[ ${permisos} == ????r??r?? ]] || [[ ${permisos} == ?????w??w? ]]
		then
			echo "${nombre}: ${permisos} "
		fi
		
	done
fi

