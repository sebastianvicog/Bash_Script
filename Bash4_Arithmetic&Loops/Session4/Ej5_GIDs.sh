#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell que analice /etc/group y que diga si una serie de GIDs que se pasan como argumentos 
# corresponden a grupos validos del sistema. Al final debe escribir por pantalla cuantos de los GIDs pasados 
# corresponden a grupos validos y cuantos no.

if [[ ${#} -eq 0 ]]
then
	echo "Error. El numero de argumentos debe de ser minimo de 1."
else
	contGruposValidos=0
	
	for i in ${*}
	do
		while read linea
		do
			gid=$( echo ${linea} | cut -d: -f3 ) # Guarda los gids
			
			if [[ "${i}" = "${gid}"  ]]
			then 
				echo "El gid ${i} corresponde al Group Name: $( echo ${linea} | cut -d: -f1 )"
				contGruposValidos=$(( ${contGruposValidos} + 1 ))
			fi
		done < /etc/group	
	done	
	
	echo -e "\nEl numero de GIDs que corresponden a grupos validos es: ${contGruposValidos}" 
	contGuposNo=$(( ${#} - ${contGruposValidos} ))
	echo -e "\nEl numero de GIDs que corresponden a grupos invalidos es: ${contGuposNo} " 
fi
