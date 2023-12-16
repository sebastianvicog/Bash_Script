#!/bin/bash

# Autor: Sebastián Vico Guzmán
#
# Ejercicio 7.1.
# Descripcion: Dados 2 argumentos: - Nombre de un fichero de texto y - Una palabra o frase entre comillas.
# El programa cuenta el numero de palabras o frases que hay en el fichero de texto pasado como argumento.


# Asignacion de argumentos a las variables. La expresion se pone entre comillas para mantener intacto el valor 
# del argumento
archivo=${1}
expresion="${2}"

# Contar el numero de palabras/frases
contador1=$(grep -ow "${expresion}" ${archivo} | wc -l)

#Imprimir el resultado
echo "EL numero de palabras/frases "${expresion}" en el archivo ${archivo} es: ${contador1}"


