#!/bin/bash
#Realice un script que agregue todos los nombres de usuario del sistema a un arreglo e implemente las siguientes
#funciones:
#existe <parametro1>: Devuelve 0 si el usuario existe en el arreglo, 1 en caso contrario.
#eliminar_usuario <parametro1>: Si el usuario pasado como parámetro existe en el arreglo lo elimina del mismo. Caso
#contrario devuelve código de error 2
#usuarios_con_patron <parametro1>: Recorre el arreglo e imprime en pantalla los nombres de los usuarios en cuyos
#caracteres aparece el patrón pasado como parámetro.
#cantidad: Imprime la cantidad total de usuarios en el arreglo.
#usuarios: Imprime todos los nombres de los usuarios que están en el arreglo.

#creo arreglo de usuario vacio:
users=()
#agrego todos los nombres de los usuarios del sistema al arreglo:
#los usuarios del sistema se encuentran en el archivo /etc/passwd, en la primer columna
users=$(cut -d: -f1 /etc/passwd)


#funciones:
existe(){
#recibe parámetro <usuario> , devuelve 0 si el usuario existe en el arreglo, 1 cc
booleano=1
for ((i=0; i<${#users[@]}; i++))
do
  if [ "${users[i]}" = "$1" ]
  then
    booleano=0
    break
  fi
done
if [ booleano -eq 0 ]
then
  exit 0
else
  exit 1
fi
}
#tambien se puede iterar sobre el arreglo como: for elemento in ${$users[@]} y accedo directamente al elemento
#
eliminar_usuario(){
#si el usuario pasado como parametro existe, lo elimina
encontro=1
for ((i=0; i<${#users[@]}; i++))
do
  if [ "${users[i]}" = "$1" ]
  then
    encontro=0
    unset users[$i]
    break
  fi
done
if [ encontró -eq 1 ]
then
  #significa q no existe el usuario
  exit 2
fi

}
usuarios_con_patron(){
for ((i=0; i<${#users[@]}; i++));
do
  #veo si aparece el caracter pasado como parametro en el nombre:
  if [ echo "${users[i]}" | grep -q "$1" ]
  #grep -q hace que no imprima el echo, se usa para condicionales
  then
    echo "${users[i]}"
  fi
done
}
cantidad(){
echo "la cantidad total de usuarios es de: ${#users[@]}" 
}
usuarios(){
#imprime nombres de usuarios que están en el arreglo
echo " ${users[@]} "
}

