#!/bin/bash
# recorro archivos del direcotrio actual
for file in  *
do
  nombre_transformado=$(echo "$file" | tr -d 'a' | tr 'a-z' 'A-Z' )
  echo "$nombre_transformado"
  # tr 'a-z' 'A-Z' --> cambia las minusculas por mayusculas
  # tr -d 'a' --> elimina la a
done
