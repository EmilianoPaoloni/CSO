#!/bin/bash
#Verifico que se haya pasado un parametro <nombreArchivo>
if [ "$#" -ne 1 ]
then
  echo "este scrit utiliza un parametro: <nombreArchivo>"
  exit 1
fi
#recupero el parametro y lo asigno a una variabe:
nomArchivo=$1

#verifico que exista:
if [ -e "$nomArchivo" ]
then
  if [ -d "$nomArchivo" ]
  then
    echo " $nomArchivo existe y es un directorio"
  elif [ -f "$nomArchivo" ]
  then
    echo " $nomArchivo existe y es un archivo"
  fi
else
  echo " $nomArchivo no existe"
  echo " creando un directorio $nomArchivo ..."
  mkdir "$nomArchivo"
fi
 
