#!/bin/bash
#enunciado ej17:
#Suponga que es administrador de un servidor de correo y se le ha encargado un listado con todos los nombres de usuario que poseen cuenta de mail. Se sabe que un #usuario que tiene cuenta de mail posee un directorio llamado mailDir en su directorio personal. Además de tener una cuenta de mail los usuarios del listado deben #tener definido a bash como su shell por defecto. Para el listado solicitado se debe generar un archivo llamado listado.txt en el /var.
#------------------------------------------------------------------------------------
#para hacer este script hay que entender como se almacena informacion en /etc/passwd
# /etc/passwd: usuario:x:1001:1001:Nombre Completo:/home/usuario:/bin/bash
# f1=usuario
# f2= contraseña del usuario
# f3= UID --> Usser ID --> identificador de usuario
# f4= GID --> Group ID --> identificador de grupo primario
# f5= informacion del uduario
# f6= directorio de inicio --> ruta al direc personal del usuario --> /home/usuario
# f7= Shell --> interprete de comandos que se utiliza cuando el usuario inicia sesion


#primero accedo al ARCHIVO /etc/passwd
for i in $(cat /etc/passwd) 
#itero sobre cada LINEA del archivo
do
  #obtengo el nombre del usuario (en campo 1)
  user=$( echo "$i" | cat -d: -f1)
  #obtengo el directorio de personal de usuario (en campo 6)
  h=$( echo "$i" | cat -d: -f6)
  #obtengo el shell por defecto que usa el usuario (en campo 7)
  s=$( echo "$i" | cat -d: -f7)
  
  #verifico que el usuario tenga directorio "mailDir" en su directorio personal:
  #verifico que el usuario tenga Bash como shell por defecto:
  if [ $(sudo find $h -type d name "mailDir" | wc -l) -eq 1 ] && [ "$s" == "bin/bash" ]
  then
    #agrego usuario al txt (la primera vez crea listado.txt)
    echo "$usuario" >> /var/listado.txt
  fi  
done

# wc -l --> cuenta el numero de lineas a la salida del comando anterior (cuantos directorios malDir se encontraron)
# sudo --> pide permiso para acceder a directorios (ejecuta acciones de superusuario)
# find $h -type d name "mailDir" --> busca directorio mailDir dentro del directorio almacenado en la variable h
#type d --> esta opcion le dice a find que solo busque directorios



