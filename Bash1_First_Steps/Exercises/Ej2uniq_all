#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Ejercicio 7.2.
# Descripcion: La orden uniq elimina las lineas de texto que estan duplicadas solo si son adyacentes. 
# Escriba una nueva orden que reciba dos parametros, 2 nombres de ficheros. Debe quitar las lineas
# repetidas de un fichero esten o no consecutivas y guardarlas en otro fichero

fichero1=${1}
fichero2=${2}

# Ordena el archivo de entrada y lo manda a la salida estandar. Uniq al no tener ningun archivo_origen 
# coge como archivo la salida estandar (lo que ha producido el sort) y lo ordena. 
# El resultado se redirige a fichero2.
sort ${fichero1} | uniq > ${fichero2}


echo "El contenido de ${fichero1} ha quitado los repetidos en ${fichero2}"
