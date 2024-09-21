#!/bin/bash
#agrega a un arreglo todos los archivos del directorio /home con terminacion .doc

arreglo=()

buscar(){
#funcion que busca un archivo pasado por parametro en el vector "arreglo"
local encontro=1
#parametro pasado: 
nombreArchivo=$1
for a in $arreglo
do
  if [ $a = "$nombreArchivo" ]
  then
    encontro=0
    break
  fi
done
#retorna 0 si el archivo esta en el arreglo, 1 cc
if [ $encontro -eq 0 ]
then
  return 0
else
  return 1
fi
}
#linea 22
verArchivo(){
nombreArchivo=$1
if buscar $nombreArchivo
then
  echo "$nombreArchivo"
else
  echo "no se encontro el archivo $nombreArchivo"
  exit 5
fi
}
#linea 49
cantidadArchivos(){
#imprime la cantidad de archivos de /home que son .doc
echo "cantidad de archivos .doc en /home: ${#arreglo[@]} "
}

borrarArchivo(){
nombreArchivo=$1
#verifico si el archivo esta en el vector
if buscar $nombreArchivo
then
  echo "¿quiere eliminar el archivo $archivo logicamente? (si/no) "
  read rta
  #en los dos casos se elimina el archivo del arreglo:
  local pos=0
  for elem in "${arreglo[@]}"
  do
    if [ $elem == $nombreArchivo ]
    then
      unset 'arreglo[$pos]'
    else
      pos=$(($pos+1))
    fi
  done
  case $rta in
    "si")
      #se elimina el archivo solo del arreglo
      return 0
      ;;
    "no")
      #se elimina el archivo del arreglo y del FileSystem
      rm $nombreArchivo
      return 0
      ;;
  esac
else
  echo "Archivo no encontrado"
  return 10
fi
}


# programa principal:

#recorro el directorio /home:
for file in "/home"
do
  #verifico si es un archivo:
  if [ -f "$file" ]
  then
    #verifico la extension:
    extension="${archivo##*.}"
    if [ extension==".doc" ]
    then
    arreglo+=("$file")
    fi
  fi
done

verArchivo hola.doc
cantidadArchivo

