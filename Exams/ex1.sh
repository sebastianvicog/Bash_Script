#!/bin/bash

# Autor: Sebastian Vico
# Descripcion: script que recorre ~/bin y si detecta un archivo que termina en .sh sin permisos de ejecución se 
# los asigna si no los tiene, cualquier otro archivo con esos permisos que no acaban en .sh los pierde
# tiene que decir cuantos archivos han ganado permisos y cuantos lo han perdido

# Ver si existe el directorio ~/bin
if [ -d ${HOME}/bin ]
then
	echo "Existe el directorio ~/bin"
	
	conPermisos=0 # Contador de archivos que han ganado permisos
	sinPermisos=0 # Contador de archivos que pierden permisos
	
	# Recorro los archivos del directorio
	for archivo in `ls ${HOME}/bin`
	do
		# Archivo que termina en .sh sin permiso de ejecucion
		if [[ -f ${archivo} ]] && [[ ${archivo} = *.sh ]] && [ ! -x ${archivo} ]
		then
			chmod +x ${archivo} # Asigna permiso de ejecucion
			conPermisos=$(( ${conPermisos} + 1 )) # contador de archivos que ganan permisos ++
		else
			# Archivo que NO termina en .sh y que tenga permisos de ejecucion
			if [[ -f ${archivo} ]] && [[ ! ${archivo} = *.sh ]] && [ -x ${archivo} ]
			then
				chmod -x ${archivo} # Retira permiso de ejecucion
				sinPermisos=$(( ${conPermiso} + 1 )) # contador archivos que pierden permisos ++
			fi
		fi
	done
	
	echo "Han ganado permisos: ${conPermisos} archivos"
	echo "Han perdido permisos: ${sinPermisos} archivos"

else
	echo "El directorio ${HOME}/bin no existe"
fi 

# Posibles mejoras:
#	- Para saber si el archivo acaba en .sh: if [ $(echo "${archivo}" | cut -d '.' -f2) == "sh"]
