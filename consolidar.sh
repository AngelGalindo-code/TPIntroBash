#!/bin/bash


filename="$HOME/EPNro1/salida/$FILENAME.txt"
entrada="$HOME/EPNro1/entrada"
procesado="$HOME/EPNro1/procesado"


# Creamos el archivo FILENAME.txt dentro de la carpeta salida

touch $filename

if [ -f $filename ]; then

        # Recorremos la carpeta entrada con los archivo ingresados manualmente y copiamos la informacion de cada archivo y lo adjuntamos a FILENAME.txt

        for archivo in "$entrada"/*; do

                while read -r linea ; do

                        echo "$linea" >> "$filename"

                done < "$archivo"

                mv $archivo $procesado/
        done



else
        echo "No existe el archivo FILENAME.txt"


fi
