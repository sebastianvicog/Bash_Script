#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 1.3. Prueba de uso de variables

var1=3

echo El contenido de la var1 es: ${var1}

unset var1

echo El contenido de var1 es: ${var1}

# Se obtiene: - 3
#             - 
# No se produce un error porque al imprimir la variable despues de borrarla porque en Bash, intentar acceder
# a una variable no establecida no es un error. Simplemente devuelve una cadena vacia
