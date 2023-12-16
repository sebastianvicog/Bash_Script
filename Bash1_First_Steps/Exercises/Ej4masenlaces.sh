#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Se pasan 2 argumentos: - un directorio y - un numero
# Mostrar los n ficheros o directorios con mas enlaces duros de ese directorio

directorio=${1}
numero=${2}


# find: Busca en el directorio proporcionado, tanto ficheros como directorios.
		# %n: Enlaces duros 
		# %p: Ruta del archivo
# sort: Ordena de acuerdo a su valor numerico y en orden descendente
# head: Mostrar los n ficheros o directorios
find ${directorio} -type f -o -type d  -printf "%n %p\n"| sort -nr | head -n ${numero}
