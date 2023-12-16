#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Ejercicio 1.2. Pruebas de uso de variables

var1=3
var2=${var1}hola
var3=$var1hola

echo El contenido de var1 es: ${var1}
echo El contenido de var1 es: ${var2}
echo El contenido de var1 es: ${var3}

# Se obtiene: - 3
#             - 3hola
#             - 
#
# La razon por la que var contiene "3hola" es porque ${var1} se expande al valor de var1, que es 3, y luego se 
#concatena con "hola".
#La razon por la que var3 esta vacia es porque $var1hola se interpreta como una variable llamada var1hola, que 
#no esta definida. EN Bash, al intentar acceder a una variable no definida simplemente devuelve una cadena 
#vacia, por lo que no se produce un error.
