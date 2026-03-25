#!/bin/bash

#Variable nombre del archivo que contiene el padrón
export FILENAME="hola"
parametro="$1"

if [ "$parametro" == "-d" ];then
rm -r ~/EPNro1
exit 0
fi

if [ ! -f ~/EPNro1/salida/${FILENAME}.txt ];then
echo "El archivo que contiene el listado no se encontró."
echo "Si ya existe en el directorio salida (creado por la opción 1), cambie la variable FILENAME al nombre del archivo con el siguiente comando:"
echo 'FILENAME="Nombre_del_archivo"'
fi

echo "1: Crear directorio EPNro1, el cual contendrá los subdirectorios entrada, salida y procesado."
echo "2: Adjuntar información contenida en los archivos de la carpeta entrada al final del listado."
echo "3: Mostrar el listado ordenado por números de padrón."
echo "4: Mostrar las 10 notas más altas del listado."
echo "5: Buscar datos a partir de un nro. de padrón ingresado."
echo "6: Salir del menu."
echo -n "Ingrese una opcion:"

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
echo -n "Ingrese un número de padrón:"
read numero_padron
grep ^$numero_padron ~/EPNro1/salida/${FILENAME}.txt
;;

6)
exit 0
;;

#TODO: parametro opcional -d
esac
