#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell script que reciba com argumentos una lista de nombres de usuario, y que compruebe si 
# existen indicando por pantaalla si el usuario existe o no

listaUsuarios=`ls /home/`

for i in "${@}"
do
	for j in "${listaUsuarios}"
	do
		if [ "${i}" = "${j}" ]
		then
			echo "El usuario ${i} existe en el sistema"
		else
			echo "El usuario ${i} no existe en el sistema"
		fi
	done	
done

# --------------------------------- OTRA FORMA -------------------------------
# for username in "${@}"
# do
#	if id -u "$username" >/dev/null 2>&1;
#	then
#		echo "El usuario ${username} existe en el sistema"
#	else
#		echo "El usuario ${username} no existe en el sistema"
#	fi
# done

