#!/bin/bash

# Autor: Sebastian Vico
# Descripcion: script that receives exactly one user name.
#			   if it exists it will tell you how many users there are with that name

# Comprobar que recibe exactamente un argumento
if [ ${#} -eq 1 ]
then
	contUsuario=0 # Contador de usuarios con el mismo nombre
	
	# Recorrer el listado de usuarios registrados en el sistema
	for usuario in `cut /etc/passwd -d ':' -f1`
	do
		# Comprobar si el argumento (un usuario) esta registrado en el sistema
		if [ "${1}" = "${usuario}" ]
		then
			contUsuario=$(( ${contUsuario} + 1 ))
		fi
	done
	
	# Comprobar si el argumento coincide con algun usuario y escribir por pantalla con cuantos
	if [ ${contUsuario} -gt 0 ]
	then
		echo "El numero de usuarios registrados con el nombre ${1} es: ${contUsuario}" 
	else
		echo "ERROR. El usuario ${1} no existe"
	fi
else
	echo "ERROR. El script debe recibir un unico argumento"
fi

