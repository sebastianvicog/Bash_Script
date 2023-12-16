#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Script que busque, en todos los directorios que cuelgan del directorio base del usuario que 
# ejecuta el script, si hay algun archivo que tenga como nombre core y que borre todos los archivos core 
# encontrados. Al final del script se debe imprimir elo numero de archivos core borrados

cont=0

while read archivo
do
	rm ${archivo}
	cont=$(( ${cont} + 1 ))
	
done < <(find ${HOME} -type f -name "core")

echo "El numero de archiovos encontrados y borrados con el nombre core es: ${cont}"

#	if [[ ${directorio} = *core ]]
#	then
#		rm ${directorio}
#		cont=$((${cont}+1))
#	fi
