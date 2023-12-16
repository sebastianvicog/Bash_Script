#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Script que escriba por pantalla cuales son los grupos que tienen asignados usuarios.
# Al final debera escribir el numero de grupos que tienen usuarios asigmnados.

cont=0
echo -e "\nLos grupos que tienen asignado al menos un usario son: "

while read linea
do
	usuariosAsignados=$( echo "${linea}" | cut -d: -f4) # Comprobar si contienen algun usuario
	if [[ "${usuariosAsignados}" =~ ^[a-zA-Z0-9,\s]+$ ]]
	then
		echo -e "\t- Grupo $( echo ${linea} | cut -d: -f1 ). Contiene: ${usuariosAsignados}"
		cont=$(( ${cont} + 1 ))
	fi
	
done < /etc/group

echo -e "\nEl numero de grupos que tienen usuarios asignados es: ${cont}"
