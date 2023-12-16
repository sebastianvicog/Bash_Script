#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 8.5
# Escribe un shell script que reciba exactamente dos argumentos que sean cadenas de caracteres y diga si la
# primera esta prdenada alfabeticamente con respecto a la segunda o no

if [ ${#} -ne 2 ]
then
	echo "No se han recibido exactamente 2 argumentos."
	exit
fi

if [[ "${1}" < "${2}" ]]
then
	echo "La cadena 1 esta ordenada alfabeticamente con respecto a la segunda"
else
	echo "La cadena 1 no esta ordenada alfabeticamente con respecto a la segunda"
fi
