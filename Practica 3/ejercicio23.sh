#!/bin/bash
array1=(1 2 3 4 5 6 7)
cantImpares=0
for elem in "${array1[@]}"
do
  if [ $(expr $elem % 2) -eq 0 ]
  then
    echo "nro: $elem"
  else
    cantImpares=$(expr $cantImpares + 1)
    #tambien puedo usar: cantImpares=(( cantImpares + 1 ))
  fi
done

echo "la cantidad de nros impares en el arreglo es: $cantImpares"
