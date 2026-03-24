#!/bin/bash

#TODO: la variable FILENAME debe ser definida por el usuario
FILENAME="hola"

echo -n "Ingrese una opcion:"
#TODO: escribir opciones del menu

read OPCION

case $OPCION in

1)
    mkdir -p ~/EPNro1/entrada
    mkdir -p ~/EPNro1/salida
    mkdir -p ~/EPNro1/procesado
;;

2)
chmod +x ~/EPNro1/consolidar.sh
~/EPNro1/consolidar.sh &
mv ~/EPNro1/salida/${FILENAME}.txt ~/EPNro1/procesado

;;

3)
if [ -f ~/EPNro1/salida/${FILENAME}.txt ]; then

sort ~/EPNro1/salida/${FILENAME}.txt -k 1n

fi
;;

4)
if [ -f ~/EPNro1/salida/${FILENAME}.txt ]; then

sort ~/EPNro1/salida/${FILENAME}.txt -k 5nr | head -n 10

fi
;;

5)
#TODO: Solicitar al usuario un nro de padrón, y mostrar por pantalla, los datos del mismo provenientes del archivo FILENAME.txt de la carpeta salida.
    echo -n "Ingrese un número de padrón:"
    read numero_padron
    #mostrar por pantalla los datos del alumno en el archivo FILENAME.txt
;;

6)
#TODO: salir del script

;;

#TODO: parametro opcional -d
esac
