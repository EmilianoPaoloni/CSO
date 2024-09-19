#!/bin/bash
#verifica cada 10 segunos si el usuario pasado por parametro se logeo

#verificoo parametro
if [ "$#" -ne 1 ]
then
  echo "este script $0 usa 1 parametro <nombre usuario>"
  exit
fi

#asignar parametro a variable
user=$1

while true 
do
  if who | grep -q $user
  then
    echo "usuario $user logeado"
    exit 0
  fi
  #dejo espearar 10 segundos:
  sleep 10 
done
