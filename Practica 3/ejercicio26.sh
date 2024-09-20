#!/bin/bash
#este script contiene una cantidad indefinida de parametros (por lo menos 1)

#verifico al menos 1 parametro (-lt: menor o igual):
if [ "$#" -lt 1 ]
then
  echo "este script utiliza al menos 1 parametro: <ruta.archivo> "
  exit 1
fi

#itero sobre todos los parametros pasados:
numero=1
inexistentes=0
for param in "$@" 
do
    #verifico que exista el archivo/directorio de param
    if [ -e "$param" ] 
    then
       #chequeo que sea parametro impar
       if [ $(expr $numero % 2) -ne 0 ]
       then
         # verifico si es archivo o directorio:
         if [ -d "$param" ]
         then
           echo "el parametro $param es un DIRECTORIO"
         elif [ -f "$param" ]
         then
           echo "el parametro $param es un ARCHIVO"
         fi
       fi
    else
      #cuenta archivos/directorios inexistentes:
      inexistentes=$((inexistentes + 1))
    fi
    numero=$((numero + 1))
done

echo "la cantidad de archivos/directorios inexistentes en el sistema es de: $inexistentes"



