#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: El comando du sirve para verificar el uso de espacio en disco en un directorio.
# Se pasan 3 argumentos: - un directorio, - una extension (algo como .jpg, .png) y un numero num
# y muestra los num ficheros que mas ocupan con esa extension. Utiliza la opcion que muestra el espacio
# en Byte, Kilobyte, Megabyte, Terabyte and Petabyte.

directorio=${1}
extension=${2}
num=${3}

# du -ha para verificar el espacio con formato legible de todos los archivos. 
# grep para hacer la busqueda de los elementos que tenga la extension pasada como argumento
# sort -hr para ordenar por tamaño y en orden inverso (de mayor a menor)
# head -n para mostrar el numero de lineas pasadas por la cabecera
du -ha ${directorio} | grep ${extension} | sort -hr | head -n ${num}
