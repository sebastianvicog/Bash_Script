#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descipcion: Script con 2 argumentos: - nombre fichero de texto
#				       - palabra o frase entre comillas dobles 
# El script debe comprobar el numero de argumentos y que el primer argumento es un fichero y el segundo un 
# texto. El programa cuenta el numero de palabras o frases que hay en el fichero de texto que se pasa
# como argumento

if [ ${#} -ne 2 ]
then
	echo "El numero de argumentos debe ser 2."
	exit
fi

if [ -f ${1} ]
then		
	if [[ "${2}" =~ ^[a-zA-Z\s]+$ ]]
	then
		contador=$(grep -ow "${2}" ${1} | wc -l)
		echo "El numero de veces que se repite la expresion "${2}" en el fichero ${1} es: ${contador}"
	else
		echo "Error. El segundo argumento debe ser una frase."
		exit
	fi
else
	echo "Error. El primer argumento debe ser un fichero"
	exit
fi

