#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell sin argumentos que analice /etc/passwd y que escriba aquellos usuarios, que no sean del
# sistema, cuyo directorio base no cuelgue de /home

while IFS=: read username password uid gid info home shell
do
	if [ ${uid} -ge 1000 ] && [ ${home} != "/home/${username}" ]
	then
		echo "Usuario: $username"
		echo "Directorio Base: $home"
	fi

done < /etc/passwd

