#!/bin/bash

# Autor: Sebastián Vico Guzmán
# Descripcion: Script que reciba exctamente 2 directorios accesibles desde el directorio de trabajo actual, y 
# que copie los archivos del primer directorio en el segudno, siempre y cuando no existan ya en el segundo 
# directorio, o bien, que el archuivo que se copia sea más reciente que el que se sobreescribe.

directorio1="`pwd ${1}`/${1}"
directorio2="`pwd ${2}`/${2}"




# Num argumentos = 2
if [ ${#} -eq 2 ]
then
	# Argumentos = 2 directorios
	if [ -d ${1} ] && [ -d ${2} ]
	then
		# Argumentos = 2 directorios accesibles desde el directorio de trabajo actual
		if [[ ! ${1} = /* ]] && [[ ! ${2} = /* ]]
		then
			contenido1=`ls ${1}`
			# Recorrer el 1er directorio
			for i in ${contenido1}
			do
				# Para usar cp necesito la ruta origen:
				echo "Directorio del archivo a copiar: ${directorio1}${i}"
				cp -u "${directorio1}${i}" ${directorio2}
			done
			
		else
			echo "Error. Los parametros deben de ser accesibles desde el directorio actual"
		fi
	else
		echo "Error. Los parametros deben de ser directorios"
	fi
else
	echo "Error. EL numero de argumentos debe de ser 2"
fi

# Otra forma sin utilizar el for:
	# Despues de las comprobaciones de que recibimnos 2 directorios accesibles desde el actual:
		# cp -u "${1}"/* "${2}"


