#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Recibir 2 parametros (2 nombres de ficheros). Lo que hace es quitar las lineas repetidas de
# un fichero, esten consecutivas o no y lo guarda en el otro fichero. EL programa debe primero comprobar que se 
# le pasan 2 argumentos, que son ficheros ordinarios y que tienen permiso de lectura.

if [ ${#} -eq 2 ]
then
	if [ -f ${1} ] && [ -f ${2} ]
	then
		if [ -r ${1} ] && [ -r ${2} ]
		then
			# Ordena el archivo de entrada y lo manda a la salida estandar. Uniq al no tener ningun 			
			# archivo_origen coge como archivo la salida estandar (lo que ha producido el sort) y lo 	
			# ordena. El resultado se redirige a fichero2.
			sort ${1} | uniq > ${2}
		else
			echo "ERROR: Los ficheros deben tener permiso de lectura"
		fi
	else
		echo "ERROR: Los argumentos deben ser ficheros ordinarios."
	fi
else
	echo "ERROR: Debe escribir 2 argumentos , usted ha escrito: ${#}"
fi
