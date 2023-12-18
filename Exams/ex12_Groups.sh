#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Write a script that screen which groups have assigned users. And write groups's number that have assigned users. 

cont=0
echo "Los grupos que tienen usuarios asignados son: "
while read linea
do
	asignado=$( echo ${linea} | cut -d: -f4 )
	if [[ "${#asignado}" -ne 0 ]]
	then
		echo "${linea}" | cut -d: -f1
		cont=$(( ${cont} + 1 ))
	fi
	
done < /etc/group

echo "El numero de grupos que tiene al menos us usuario asignado es: ${cont}"
