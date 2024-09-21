#!/bin/bash
#este script mueve todo los ejecutables a un subdirectorio de HOME "bin"

#si no existe "bin", lo creo:
ruta_bin="$HOME/bin"
if [ ! -d $ruta_bin ]
then
  echo "creo el direcotrio bin en HOME"
  mkdir "$ruta_bin"
fi

#mover ejecutables a bin:
cant=0
for a in *
do
  #verifico que sea un archivo y que sea ejecutable
  if [ -f $a ] && [ -x $a ]
  then
    echo "moviendo archivo $a a $ruta_bin"
    mv "$a" "$ruta_bin"
    cant=$(( $cant + 1 ))
  fi
done

echo "cantidad de archivos movidos: $cant"
