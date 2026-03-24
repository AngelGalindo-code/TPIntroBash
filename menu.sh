#!/bin/bash

# Creacion del menu para seleccionar opciones

opc=0

epnro1="$HOME/EPNro1"
entrada="$HOME/EPNro1/entrada"
salida="$HOME/EPNro1/salida"
procesado="$HOME/EPNro1/procesado"
filename="$HOME/EPNro1/salida/$FILENAME.txt"

if [  "$1"  ==  "-d" ]; then
	if [  -d  "$HOME/EPNro1" ]; then
 		echo "Borrando entorno y procesos...	"
		sleep 2
 		rm -r "$HOME/EPNro1"
 		pkill -f consolidar.sh
 		clear
 		echo "Entorno y procesos eliminados."
	else
  	   echo "El entorno no existe."
 	fi
 	exit
fi

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

            mkdir -p  "$entrada" "$salida" "$procesado"
            ls "$epnro1"
            ;;

		2)
			clear
        			
			echo "Corriendo proceso..."
        	bash ./consolidar.sh &
        	sleep 2
        	echo "Proceso finalizado!"
        	;;


		3)
			clear

			if [ -f "$filename" ]; then
				echo "Listado de alumnos ordenado por padron:"
				sort -nr "$filename" | cat $filename
			else
				echo "Archivo inexistente"
			fi
			sleep 2
			;;

		4)
		  	clear

			if [ -f "$filename" ]; then

		 		sort -k5,5nr "$filename" | head
			else
				echo "Archivo inexistente."
			fi
			sleep 2
			;;

		5)
			clear

	        echo "Digite el padron:"
			read padron

      		if [ -f "$filename" ]; then
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
