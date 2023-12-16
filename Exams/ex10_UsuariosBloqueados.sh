#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Script que saque una lista por pantalla de los usuarios del sistema bloqueados.

echo "Los usuarios bloqueados son: "
cont=0

sudo bash -c 'while read lin
do
	bloq=$(echo ${lin} | cut -d: -f2)
	
	if [[ "${bloq}" == "!" ]]
	then
		cont=$(( ${cont}+1 ))
		echo -e "\t${cont}. ${lin}" | cut -d: -f1
	fi
	
done < /etc/shadow'

