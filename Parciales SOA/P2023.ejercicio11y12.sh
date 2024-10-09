#!/bin/bash
#se recibe un directorio como parametro. Genero un vector que hace de cache, contiene 
#todos los archivos de ese directorio
#creo el vector cache vacio:
cache=()
#funciones:
delete(){
#elimina del arreglo y del disco el archivo pasado como parametro
#eliminar elemento de arreglo --> unset 'array[$pos]'
#busco la posicion del elemento a eliminar:
pos=0
for ((i=0; i<${#cache[@]} ; i++))
do
  elem=cache[$i]
  if [[ $elem == $1 ]]
  then
    pos=i
    break
  fi
done
#elimino el archivo del arreglo
unset 'cache[$pos]'
#elimino el archivo del disco
rm "$1"
echo "archivo $1 eliminado"
}
index(){
#recibe como parametro el nombre de un archivo, si existe, se muestra el indice en el arreglo.
pos=-1
for ((i=0; i<${#cache[@]} ; i++))
do
  elem=cache[$i]
  if [ $elem = $1 ]
  then
    pos=i
    break
  fi
done
if [ $pos -eq -1 ]
then
  #significa que se recorrio el vector y no se encontro el archivo
  echo "el archivo $1 no existe"
else
  echo " posicion en el arreglo: $pos "
fi
}
size(){
#muestra la cantidad de archivos (tamaño del arreglo)
echo "cantidad de archivos: ${#cache[@]} "
}
list(){
#muestra listado de archivos:
echo "${cache[@]}"
}
##############CODIGO PRINCIPAL################
#verifico pasaje de parametros:
if [ "$#" -ne 1 ]
then
  echo "este script utiliza un parametro <nombreDirectorio>"
  exit 1
fi
#verifico que el directorio exista:
if [ ! -d "$1" ]
then 
  echo "el directorio $1 NO EXISTE CAPO"
  exit 1
fi
#recorro el directorio en $1 y agrego todos los archivos al vector:
for file in "$1"/*
do
  #verifico que sea un archivo (para no meterme en subdirectorios)
  if [ -f "$file" ]
  then
    cache+=("$file")
  fi
done
#verifico correcto llenado del arreglo
echo "${cache[@]}"

#------------------ arranca ejercicio 12 ------------------
#menu interactivo
#booleano para terminar bucle
continuar=1
#cantidad de acciones a ejecutar:
acciones=0
while [ $continuar -ne 0 ]
do
  echo "-----------------------"
  echo "MENU - elija una opcion"
  echo "delete - index - size - list - exit "
  read opcion
  acciones=$((acciones + 1))
  case $opcion in
    "delete")
      echo "escriba el archivo que quiere eliminar"
      read a
      delete $a
    ;;
    "index")
      echo "escriba el nombre del archivo que quiere indexar"
      read a
      index $a
    ;;
    "size")
      size
    ;;
    "list")
      list
    ;;
    exit)
      continuar=0
    ;;
  esac
done
