#!/bin/bash

# Autor: Sebastian Vico
# Descripcion: script que recibe una lista de directorios y un tamaño, si el tamaño es mayor o igual se renombra 
# a mayusculas si es menor a minusculas. Tambier poner cuantos se han renombrado a mayus y cuantos a minus

# DOY POR HECHO QUE EL PRIMER ARGUMENTO ES EL TAMAÑO Y QUE TE LO DAN EN BYTES

# Comprobar que el numero de argumentos es mayor o igual a 2
if [ ${#} -ge 2 ]
then
	contMayus=0 # Contador de los directorios renombrados a mayuscula
	contMinus=0 # Contador de los directorios renombrados a minuscula
		
	# Comprobar que el primer argumento es un numero
	if [[ "${1}" =~ ^[0-9]+$ ]]
	then 
		# Recorremos los directorios recibidos como argumentos
		for directorio in ${*}
		do
			# Comprobar si el argumento es un directorio
			if [ -d ${directorio} ]
			then
				# Si el tamaño del directorio es mayor o igual al argumento1 = tamaño
				if [ $(du -b ${directorio} | cut -f1) -ge ${1} ]
				then
					mv ${directorio} ${directorio^^} # Renombrar a mayusculas
					contMayus=$(( ${mayus}+1 )) # Actualizo contador
				
				# Si el tamaño del directorio es menor que el argumento1 = tamaño
				else
					mv ${directorio} ${directorio,,} # Renombrar a minusculas
					contMinus=$(( ${contMinus}+1 )) # Actualizo contador
					
				fi
				
			fi
				
		done
		
		echo "El numero de directorios cuyo tamanio es mayor a ${1} es: ${contMayus}"
		echo "El numero de directorios cuyo tamanio es menor a ${1} es: ${contMinus}"
	else
		echo "El primer argumento debe de ser un numero"
	fi
else
	echo "El numero de argumentos debe de ser minimo de 2"
fi

