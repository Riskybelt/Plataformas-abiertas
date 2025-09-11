#!/bin/bash

#Parte 1 

#Funcion de ayuda que incluye las opciones de "getops" 

ayuda () {
	echo "Para inicializar utilizar acces.log (valido)"
	echo ""
	echo "si desea imprimir un campo y cantidad de resultados en especifico utilizar los comandos -f y -t antes de acces.log "	
	echo""
	echo "opciones: "	
        echo ""
	echo "-f: Campo a filtrar: PATH (defecto), IP, STATUS."
	echo ""
	echo "-t: N cantidad de resultados mostrados (#5 por defecto)"
	echo ""
	exit 0

# opcion de ayuda -h
}

if [[ "$1" == "-h" ]]; then
       ayuda
fi

#Declaramos los campos y cantidad de resultados por defecto antes escribir el comando getopts 

CAMPO="PATH"

N=5

#incorporacion del comando "getopts" para agregar mas opciones al script y hacerlo mas dinamico para el usuario, mediante el while aseguramos que no importe el orden de opciones ya que lo recorrera hasta encontrar una salida valida

while getopts "f:t:" opt; do
	case $opt in 
		f) 
			if [[ "$OPTARG" == "PATH" || "$OPTARG" == "IP" || "$OPTARG" == "STATUS" ]]; then
			       CAMPO="$OPTARG"	
		        else
			       CAMPO="PATH"
			fi
			;;
	        t) 

# Utilizamos el 2>/dev/null para que si se ingresa un parametro distinto a un numero lo tire al stderr y se "borre" con el /dev/null, asi script sigue con el parametro por defecto sin tirar un codigo de error

	                if [ "$OPTARG" -gt 0 ] 2>/dev/null; then
				N="$OPTARG"
			else 
				N=5 
			fi 
			;;
		esac 
	done




# Aseguramos que Log es leido como primer argumento brindado independientemente de haber ingresado otros parametros antes del acces.log mediante el getopts

shift $((OPTIND -1)) 
log="$1"

# Verificacion de que se brinde el archivo, exista y tenga permisos de lectura, primero revisa la cantidad de argumentos brindados, luego si existe y por ultimo si tiene permisos de lectura. 

if [[ $# -lt 1 || ! -e "$log" || ! -r "$log" ]]; then
echo "Error, no se ingreso archivo, no existe o no tiene permisos de lectura" >&2 
exit 1

fi

#Mostramos el numero total de linea de nuestro log: 

Lineas_totales=$(wc -l < "$log") 

echo "Lineas: $Lineas_totales"

#Mostramos las primeras 3 lineas del Log

echo "Primeras 3 lineas: "

head -n 3 "$log" 

#campo a imprimir segun lo elegido por el usuario o la opcion por defecto 

case $CAMPO in 
	IP) col=1 
		;;
	PATH) col=7
		;;
	STATUS) col=9
		;;
esac 

echo "" 
echo ""

#Imprimimos el campo filtrado y la cantidad de resultados a mostrar

echo "los $CAMPO mas repetidos son: "

awk -v columna=$col '{print $columna}' "$log" | sort | uniq -c | sort -nr | head -n "$N" 



