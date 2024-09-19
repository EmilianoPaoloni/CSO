#!/bin/bash
array1=(1 3 5 7 3 2)

productoria() {
  a=$1
  producto=1
  for elem in "${a[@]}"
  do
  producto=$(expr $producto/*$elem)
  done
  return producto
}

echo " productoria "array1" "
