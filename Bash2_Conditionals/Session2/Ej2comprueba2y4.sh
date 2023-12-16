#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 8.2
# Comprueba si se han pasado entre 2 y 4 argumentos, en caso de que no se le hayan pasado ese
# numero de argumentos que escriba un error, y en caso de que si se le hayan pasado que los escriba por
# pantalla

if [ ${#} -lt 2 ] || [ ${#} -gt 4 ]
then
	echo "Error. No se ha pasado un numero de elementos entre [2 - 4]. "
else
	echo "Se han pasado los elementos: "${*}" "
fi
