#!/bin/bash
#verifico el pasaje de 1 parametro:
if [ "$#" -ne 1 ]
then
  echo "este script usa 1 parametro: <nombreDirectorio>"
  exit 1
fi

#asigno nombre a variable
directorio=$1

escritura=0
lectura=0
#verifico que el directorio exista:
if [ -e "$directorio" ]
then
  #itero sobre cada archivo del directorio:
  for file in $directorio\*
  do
    #verifico que sea un archivo
    if [ -f "$file" ]
    then
      #verifico permiso de lectura y escritura
      if [ -r "$file" ]
      then
        lectura=$(($lectura + 1))
      fi
      if [ -w "$file" ]
      then
        escritura=$(($escritura + 1))
      fi
    fi
  done
  echo "cant de archivos con permiso de escritura: $escritura" 
  echo "cant de archivos con permiso de lectura: $lectura" 
else
  echo "error 4, el directorio no existe"
fi 
