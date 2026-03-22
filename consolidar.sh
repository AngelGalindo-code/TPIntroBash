echo "Copiando archivos de entrada..."
		sleep 2

		carpetainfo="$HOME/EPNro1/entrada"

		while read linea ; do

			echo "$linea" >> "$archivo"

		done < $carpetainfo/infoalumnos.txt

		echo "Pasando FILENAME.txt a carpeta procesado..."
		sleep 2
		cp "$archivo" "$HOME/EPNro1/procesado" &&  ls "$HOME/EPNro1/procesado" && cat "$HOME/EPNro1/procesado/FILENAME.txt"
                ;;
