#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Listar el contenido con cat /proc/meminfo, estudialo y escribe un script que diga en un instante 
# determinado, cuanta memoria en megabytes ocupan los buffers y las tablas de paginas

# Obtener la uinformacion que buscamos
meminfo=$( cat /proc/meminfo | grep -E 'Buffers' )
meminfo2=$( cat /proc/meminfo | grep -E 'PageTables' )

# Extraer los valores numericos
buffers=$( echo ${meminfo} | awk '{print $2}' )
pageTables=$( echo ${meminfo2} | awk '{print $2}' ) 

# Imprimir informacion en KB
echo "${buffers} kB"
echo "${pageTables} kB"

# Convertir a MG
buffersMB=$( echo "scale=2; ${buffers} / 1024" | bc )
pageTablesMB=$( echo "scale=2; ${pageTables} / 1024" | bc )

# Mostrar en MB
echo "${buffersMB} MB"
echo "${pageTablesMB} MB"
