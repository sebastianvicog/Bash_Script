#!/bin/bash

# Autor: Sebastian Vico
# Descripcion: script that runs ~/bin and if it detects a file that ends in .sh without execution permissions it assigns them if it does not have them. 
#		       Any other file with those permissions that do not end in .sh loses them. 
#              It has to tell how many files have gained permissions and how many have lost them. 


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
