#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Shell que saque una lista por pantalla de aquellos usuarios del sistema que estan bloqueados.
# Recuerda que un usuartio bloqueado tiene en el archivo /etc/shadow un signo ! en lugar de una contraseña 
# cifrada. Recuerda que para acceder a /etc/shadow hay que tener permisos de root.

sudo bash -c 'while read linea
do
	bloqueados=$( echo ${linea} | cut -d: -f2  ) # Quiero ir comprobando el 2º dato de /etc/shadow
	if [[ "${bloqueados}" = ! ]]
	then
		echo ${linea} | cut -d: -f1
	fi
	

done < /etc/shadow'

