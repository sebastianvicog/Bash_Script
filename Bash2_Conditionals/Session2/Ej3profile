#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 8.3
# Escribe un shell script que reciba exactamente un argumento, un nombre de usuario, y compruebe si
# en el directorio base de ese usuario existe un archivo llamado .profile. SI no existe, qeu lo copie del
# directorio /etc/skel en el directorio del usuario y le de permisos -rw-r--r--

# Si el shell recibe mas de un elemento
if [ ${#} -ne 1 ]
then
	echo "Numero de argumentos invalido, solo se puede pasar 1. "
	exit
fi

usuario=${1}


# Si el usuario existe (envia el resultado de la orden id -u a /dev/null)
if 
	id -u ${usuario} >/dev/null
then
	# Comprobar si en el directorio base de ese usuario existe el archivo .profile
	if [ -e /home/${usuario}/.profile ]
	then
		echo "El archivo .profile existe. "
		
	# Si no existe en el directorio base de ese usuario
	else
		cp /etc/skel/.profile /home/${usuario}/
		chmod 644 /home/${usuario}/.profile
		echo "El archivo .profile ha sido copiado y se han establecido los permisos. "
	fi
else 
	echo "El usuario proporcionado no existe."
	
fi
	


