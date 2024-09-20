#!/bin/bash
#operaciones basicas sobre arreglos:

array=()

inicializar() {
#crea un arreglo vacio
arrayVacio=()
}

agregar_elem(){
#agrega elemento parametro al final del arreglo
param=$1
#la ultima poscion del arreglo es: ${#array[@]} (su longitud)
array[${#array[@]}]=$param
}
#linea 18
eliminar_elem(){
#elimina elemento en la posicion pasada como parametro
#valido que se reciba una poscion existente:
pos=$1
if [ $pos -le ${#array[@]} ]
then
  unset 'array[$pos]'
else
  echo "posicion invalida"
fi
}
#linea 28
longitud(){
#imprime la longitud del vector en pantalla
echo "longitud del vector: ${#array[@]}"
}

imprimir(){
#imprime todos los elementos del vector en pantalla
echo "elementos del arreglo: ${array[@]}"
}

inicializar_con_valores(){
#crea un array de longitud <parametro1> y en todas las posiciones asigna <parametro2>
p1=$1
p2=$2
#primero creo el arreglo vacio:
array=()
#asigno p2 a todas las posciones:
for ((i=0; i<$p1; i++))
do
  array[$i]=$p2
done
}


agregar_elem 2
agregar_elem 3
agregar_elem 4
imprimir
eliminar_elem 2
imprimir
inicializar_con_valores 3 1
