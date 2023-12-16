#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell que renombre los archivos del directorio ~/bin usando el siguiente nombre:
# nombre.###.sh donde nombte es el nombre que rtenga cada script sin extension, ### es un numero secuencial
# comenzando en 000 que se incrementa para cada nuevo shell script que se renombra

cont=0

for arc in ~/bin/*
do
	if [ -f ${arc} ] && [ ! -x ${arc} ]
	then
		if [ ${cont} -lt 10 ]
		then
			mv ${arc} "${arc%.*}.00${cont}.sh"
		fi
		
		if [ ${cont} -ge 10 ] && [ ${cont} -lt 100 ]
		then
			mv ${arc} "${arc%.*}.0${cont}.sh"
		fi
		
		if [ ${cont} -ge 100 ]
		then
			mv ${arc} "${arc%.*}.${cont}.sh"
		fi
		
		cont=$(( ${cont} + 1))
	fi
done
