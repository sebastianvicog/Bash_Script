#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion. Ejercicio 1: Escribir un shell que renombre todos los archivos ejecutables del directorio ~/bin 
# de forma que le añada los caracteres .sh.

directorio=`ls ~/bin`

for i in ${directorio}
do
	if [ -f ~/bin/${i} ] && [ -x ~/bin/${i} ]
	then
		mv "${HOME}/bin/${i}" "${HOME}/bin/${i}.sh"
	fi
done

