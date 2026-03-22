#!/bin/bash

# Creacion del menu para seleccionar opciones

opc=0

epnro1="$HOME/EPNro1"
entrada="$HOME/EPNro1/entrada"
salida="$HOME/EPNro1/salida"
procesado="$HOME/EPNro1/procesado"
filename="$HOME/EPNro1/salida/FILENAME.txt"

while [ $opc -ne 6 ]; do

	 echo "        MENU         "
    	echo "[1] Crear entorno: EPNro1, entrada, salida y proceso"
    	echo "[2] Correr proceso"
    	echo "[3] Mostrar listado de alumnos(ordenado por padron)"
    	echo "[4] Mostar las 10 notas mas altas"
    	echo "[5] Buscar alumno por padron"
    	echo "[6] Salir"
    	echo ""
    	echo "Ingrese un opcion: "

	read opc

        case $opc in
		1)
			clear
            			echo "Creando carpetas..."
            		sleep 2

            			mkdir -p  $HOME/EPNro1/entrada $HOME/EPNro1/salida $HOME/EPNro1/procesado

            		ls "$epnro1"
            		;;

		2)
			2)clear
        			echo "Corriendo proceso..."
        			bash $HOME/consolidar.sh
        		sleep 2
        			echo "Proceso finalizado!"
        		;;


		3)
			clear

			if [ -f "$archivo" ]; then
				echo "Listado de alumnos ordenado por padron:"
				sort -nr "$archivo" | cat $filename
			else
				echo "Archivo inexistente"
			fi
			sleep 2
			;;

		4)
		  	clear

			if [ -f "$archivo" ]; then

		 		sort -k5,5nr "$archivo" | head
			else
				echo "Archivo inexistente."
			fi
			sleep 2
			;;

		5)
			clear

	        		echo "Digite el padron:"
			read padron

      			if [ -f "$archivo" ]; then
				grep "$padron" "$filename"

			else
				echo "Padron inexistente."
			fi
			sleep 2
			;;


		6)
			clear
				echo "Saliendo..."
			;;
		*) 	clear
				echo "Opcion invalida."
			;;
			esac

done
