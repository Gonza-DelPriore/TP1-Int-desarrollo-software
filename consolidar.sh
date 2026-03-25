#!/bin/bash

#FILENAME definido en menu.sh
for archivo in $(find ~/EPNro1/entrada/ -type f) ; do
        cat $archivo >> ~/EPNro1/salida/${FILENAME}.txt
done
