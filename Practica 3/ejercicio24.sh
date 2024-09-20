#!/bin/bash
#vectores con igual longitud:
vector1=(1 3 5 7)
vector2=(2 4 5 6)
longitud=${#vector1[@]}
for ((i=0; i<$longitud; i++))
do
  suma=$(( vector1[i] + vector2[i] ))
  echo "La suma de los elementos de la poscion $i es  $suma"
done
