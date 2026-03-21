#!/bin/bash

# Creacion del menu para seleccionar opciones

opc=0

while [ $opc -ne 6 ]; do

	echo "[1] Crear entorno: entrada, salida y procesado"
	echo "[2] Correr proceso"
	echo "[3] Mostrar listado de alumnos (ordenado por padron)"
	echo "[4] Mostrar las 10 notas mas altas."
	echo "[5] Buscar alumno por padron."
	echo "[6] Salir."

	read opc

        case $opc in

		1)
			clear
            	echo "Creando carpetas..."
            sleep 2

            mkdir -p  $HOME/EPNro1/entrada $HOME/EPNro1/salida $HOME/EPNro1/procesado

            ls $HOME/EPNro1
            ;;

		2)
			clear
            echo "Creando archivo..."
            sleep 2

            archivo="$HOME/EPNro1/salida/$FILENAME.txt"
			touch $archivo

            if [ -f  "$archivo" ]; then
            echo "Archivo creado exitosamente. Iniciando iniciando proceso background "

			bash "$HOME/EPNro1/consolidar.sh" &
            else
            echo "No se pudo crear el archivo"

			fi
			;;


		3)
			clear
			archivo="$HOME/EPNro1/salida/$FILENAME.txt"

			if [ -f "$archivo" ]; then
				echo "Listado de alumnos ordenado por padron:"
				sort -nr "$archivo" | cat $archivo
			else
				echo "Archivo inexistente"
			fi
			sleep 2
			;;

		4)
		  	clear
			archivo="$HOME/EPNro1/salida/$FILENAME.txt"

			if [ -f "$archivo" ]; then

		 		sort -k5,5nr "$archivo" | head
			else
				echo "Archivo inexistente."
			fi
			sleep 2
			;;

		5)
			clear
	        	archivo="$HOME/EPNro1/salida/$FILENAME.txt"

	        		echo "Digite el padron:"
			read padron

      			if [ -f "$archivo" ]; then
				grep "$padron" "$archivo"

			else
				echo "Padron inexistente."
			fi
			sleep 2
			;;


		6 
			clear
				echo "Saliendo..."
			sleep 2
			;;
		*) 	clear
				echo "Opcion invalida."
			;;
			esac

			done
