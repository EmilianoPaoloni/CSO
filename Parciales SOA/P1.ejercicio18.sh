#!/bin/bash
#Se desea saber el uso del consumo de recursos del sistema por parte de los usuarios. Desarrolle un script que se correrá ingresando como argumento los nombres de los #usuarios de los cuales se necesita obtener dicha información, no se sabe cuántos son con anticipación.
#Para la realización del script debe definir las siguientes funciones:
#esta_logueado(): devuelve true si el usuario pasado como argumento está logueado.
#cant_procesos(): devuelve la cantidad de procesos que está corriendo un usuario.
#uso_de_procesos(): devuelve true si el usuario pasado como argumento, usando la función cant_procesos, está corriendo más de 100 procesos.
#Utilizando la funcionalidad anterior, el script debe guardar en un archivo de log, en una ubicación apropiada del file system, el nombre de los usuarios que estén #corriendo más de 100 procesos junto con la fecha de ejecución del script.

esta_logueado(){
#verifica si el usuario pasado como parametro esta logueado:
user=$1
if [ $( who | grep "$user" | wc -l) -eq 1 ]
then
  exit 0
else
  exit 1
fi
}
# who | grep "$user" --> devuelve lista de usuarios logueados, con nombre $user
# $( who | grep "$user" | wc -l ) cuenta la cantidad de lineas que devuelve lo anterior

cant_procesos(){
#devuelve cantidad de procesos que esta corriendo el usuario pasado parametro
esta_logueado() $1
if [ $? -eq 0 ]
then
  cant=$(ps -aux | grep -w $1 | wc -l)
  echo "$cant"
else
  exit 0
fi
}
# ps -aux --> lista los procesos activos en el sistema
# grep -w $1 --> se queda con las lineas de los procesos pertenecientes al usuario almacenado en $1
# wc -l --> cuenta cantidad de procesos con las caracteristicas dadas

uso_de_procesos(){
#devuelve true si el usuario parametro esta corriendo mas de 100 procesos
cant_procesos() $1
if [ $? -ge 100 ]
then
  exit 0
else
  exit 1
fi
}

#codigo ppal:
#verifico que haya al menos 1 usuario pasado como parametro:
if [ ! "$#" -ge 1 ]   #ge= mayor o igual
then 
  echo "este script usa al menos 1 parametro <nombre_usuario>"
  exit 1
fi
#creo archivo en /var/log/ :
echo "fecha: $(date) " >> /var/log/reporte
#recorro todos los usuarios pasados como parametro:
for i in $*
do
  uso_de_procesos $i
  if [ $? -eq 0 ]
  then
    #agrego usuario al final del archivo
    echo " nombre: $i " >> /var/log/reporte
  fi
done
