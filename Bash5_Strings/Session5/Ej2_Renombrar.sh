#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell que renombre todos los archivos ejecutables de ~/bin, de forma que le añada los caracteres
# .sh si el archivo no acaba en .sh.

if [ -d ~/bin ]
then
	for archivo in ~/bin/*
	do 	
		if [ -f ${archivo} ] && [ -x ${archivo} ]
		then
			mv ${archivo} "${archivo}.sh"
		fi 
	done
fi
