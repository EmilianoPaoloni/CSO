#!/bin/bash

#tomo nombres de usuarios y los guardo en el arreglo:
arreglo=($(cat /etc/group | grep users | cut -d: -f4 | tr ',' ' '))

#recupero parametro/s  pasado/s
opcion=$1
pos=$2

case $opcion in
  "-b") #si existe posicion pos en el arreglo, imprime ese elemento
    if [ ${#arreglo[@]} -gt  $pos ]
    then  
      echo "$arreglo[$pos]"
    else
      echo "error, poscion invalida"
    fi
  ;;
  "-l")
    echo "longitud del arreglo: ${#arreglo[@]}"
  ;;
  "-i")
    for elem in "${arreglo[@]}"
    do
    echo "$elem"
    done
  ;;
  esac
  
