#!/bin/bash
#Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (validar al menos
# 1 parámetro). Cada parámetro representa la ruta absoluta de un archivo o directorio del sistema. El script deberá
#iterar por todos los parámetros recibidos y:
#Si el parámetro es un archivo existente en el File System deberá comprimirlo, dejando el archivo comprimido en vez
#del original.
#Si el parámetro es un directorio existente en el file system:
# -si tiene permiso de lectura, deberá empaquetarlo y comprimirlo.
# -si tiene permiso de escritura, deberá eliminarlo junto con todo su contenido. 
#Si el parámetro no es un elemento del File System (no existe), deberá contarlo e indicar cantidad total al finalizar 
#el script

#valido 1 parámetro:
if [ "$#" -ne 1 ]
then
  echo "este archivo utiliza al menos 1 parámetro"
  exit 1
fi
#incializo cant (cantidad total de elementos que no existen en el file system)
cant=0
#itero sobre todos los parámetros recibidos:
#utilizo "$*" --> contiene todos los parámetros pasado al script en forma de cadena, separados por espacios
for p in "$*"
do
  #verifico si es un archivo
  if [ -f "$p" ]
  then
    #comprimo el archivo:
    #como lo comprimo con el mismo nombre, el nuevo arch comprimido "pisa" al original (no hace falta eliminarlo)
    gzip "$p"
  elif [ -d "$p" ]
  then
    #--verifico si tiene permiso de lectura:
    if [ -r $p ]
    then
      #empaqueto y comprimo:
      tar -cvzf "$p".tar.gz "$p"
    #--verifico si tiene permiso de escritura:
    elif [ -w $p ]
    then
      #elimino directorio
      rm -r "$p"
    fi
  else
  then
    cant=$((cant + 1))
  fi
done
#informo cant:
echo "la cantidad de parámetros pasados que no existen en el file system es: $cant"