#!/bin/bash
#enunciado:
#Escribir un script de Bash que reciba un nombre de usuario como parámetro. Si el usuario ingresado como parámetro NO es un usuario del sistema el script debe #finalizar con el código de error 1. En caso contrario, debe verificar cada 30 segundos si el usuario está logueado. Al detectar que está logueado debe registrar en un #archivo llamado access-<NOMBRE DE USUARIO>.log el nombre del usuario junto con la fecha en que se lo detectó. NO debe borrar el contenido previo de este archivo y #este archivo debe escribirse en una ubicación apropiada del file system. Al detectar 30 veces que el usuario está logueado el script debe finalizar con el código de #error 0.

#recibe como parametro el nombre de un usuario, verifico:
if [ '#$' -ne 1 ]
then
  echo "este script usa un parametro <nombreUsuario>"
  exit 1
fi
#verifico si el usuario del parametro es un usuario del sistema:
#los usuarios del sistema se encuentran en el archivo /etc/passwd !!!
#obtengo archivo /etc/passwd:
info_usuarios=$(cat /etc/passwd)
#itero sobre todos los usuarios para ver si ecnuentro a $user
encontro=1
for i in $info_usuarios
do
  #el usuario se encuentra en el campo 1
  u=$(echo $i | cat -d: -f1)
  if [ $u == $1 ]
  then
    encontro=0
    break
  fi
done
if [ encontro -ne 0 ]
then
  echo "no se encontro el usuario"
  exit 1
else
  terminar=0
  while [terminar -ne 30]
  do
    #verifico si el usuario esta logueado
    if [ who | grep $1 | wc -l ]
    then
      #fecha
      fecha=$(date)
      #agrego el usuario al archivo
      echo "$1, $fecha" >> /dev/acces.<$1>.log
      #incremento terminar:
      terminar=((terminar + 1))
    fi
    sleep 30
  done
  exit 0
  fi
