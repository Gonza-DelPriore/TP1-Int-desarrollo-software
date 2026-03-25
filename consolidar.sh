#!/bin/bash
export FILENAME
for archivo in $(find ~/EPNro1/entrada/ -type f) ; do
        cat $archivo >> ~/EPNro1/salida/${FILENAME}.txt
done
