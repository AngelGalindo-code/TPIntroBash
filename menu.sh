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
