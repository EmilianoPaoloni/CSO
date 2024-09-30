#!/bin/bash
#verifico parametro pasado:
if [ "$#" -ne 1 ]
then
  echo "este script una <extension>"
fi
#defino variable archivo de salida:
output_file="reporte.txt"
#recupero parametro:
extension=$1
#cuento cantidad de archivos que tiene el usuario con esa extension:
#obtengo los usuarios del sistema:
usuarios=$(cut -d: -f1/etc/passwd)
#cut -d: -f1 --> extrae la columna 1 del archivo etc/passwd
for user in $usuarios do
  #buscar el directorio home del usuario:
  home_dir=$(getent passwd "$user" | cut -d: -f6)
  #verifico si existe el directorio home del usuario:
  if [ -d "$home_dir" ]
  then
    #contar archivos  con la extension pasada por parametro:
    cant=$(find "$home_dir" -type f -name ".*$extension" 2>dev/null | wc -l)
  
    #agregar informacion al .txt si cant es mayor a 0:
    if [ cant -gt 0 ]
    then
      echo "$usuario $cantidad" >> "output_file"
      # el ' >> ' escribe sobre el arch, y si no existe lo crea, por eso no se crea antes output_file!
    fi
  fi
done

#mensaje:
echo "reporte guardado en $output_file
