#!/bin/bash
#la pila va a ser un arreglo (los arreglos en shell son dinamicos)
stack=()
#funciones de la stack:
#funcion push: recibe un parametro y lo 'apila'
push(){
  elem=$1
  stack[${#stack[@]}]=$elem
}
#funcion pop: saca el ultimo elemento de la pila
pop(){
  #verifico que la pila no este vacia:
  if [ ${#stack[@]} -eq 0 ]
  then
        echo "La pila está vacía, no se puede hacer pop."
  else
    unset stack[${#stack[@]}-1]
  fi
}
#funcion length: devuelve longitud de la pila
length(){
    if [ ${#stack[@]} -eq 0 ]; then
        echo "La pila está vacía, no se puede hacer pop."
    else
       echo " Longitud: ${#stack[@]} "
    fi
}
#funcion print: imprime todos los elementos de la pila
print(){
  echo " ${stack[*]} "
}
push "1"
push "1"
push "2"
push "1"
push "1"
push "2"
push "1"
push "1"
push "2"
push "10"
pop
pop
pop
length
print
