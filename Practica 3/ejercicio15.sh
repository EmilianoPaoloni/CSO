#!/bin/bash
#comando cut: permite procesar lineas de entrada que recibe archivo, entrada
#estandar, resultado de otro comando, etc, y cortar columnas o campos, siendo
#posible indicar cual es el delimitador de las mismas

#recibe un archivo como parametro (separado con algun delimitador):
if [ '#$' -ne 1 ]
then
  echo "este script usa un parametro <nombreArchivo>"
  exit 1
fi

nomArch=$1
#supongo que el archivo esta delimitado por ":"como si fueran columnas
#me quedo con la primer columna del archivo
echo cut -d : f1 $nomArchivo
