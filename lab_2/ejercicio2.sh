#!/bin/bash

#Declaramos donde se va a guardar nuestros argumentos

arg=$1 

#Declaramos donde se va a guardar nuestro log 

log="procesos.log"

#Nos aseguramos de tener siempre un log vacio

> $log 

#Aseguramos que solo acepte un argumento

if [[ $# -ne 1 ]]; then
	echo " Error $0: argumento no valido."
	exit 1 
fi 

#Enviamos nuestro proceso al segundo bg  que no interfiera con la consola 

$1 & 

#Mediante $! guardamos el ultimo proceso en bg en una variable, que en este caso es el proceso que pasamos en entrada.

proceso=$! 

#Mediante un while y el comando kill -0, verificamos que el proceso siga en pie sin matarlo, si no sigue en pie sale del bucle 

while kill -0 $proceso; do

#Mediante date, registramos el tiempo en el quevan ocurriendo los procesos y lo guardamos en una variable para que lo lea gnuplot y lo pueda graficar sin problemas

	tiempo=$(date +"%H:%M:%S")>&2

 
#Mediante ps -p mostramos la informacion del proceso que se tenemos guardado en "proceso", el -o seguido de %cpu, %mem indica que quiere esos datos como output y el --no-headers evita que se imprima los titulos de cpu y mem en el log, para evitar que falle el gnuplot. 
	datos=$(ps -p $proceso -o %cpu,%mem --no-headers )
 
	
#Agregamos toda informacion guardada en las variables a nuestro log

	echo "$tiempo $datos" >> $log

done 


#Configuramos el gnuplot
	
gnuplot -persist <<-EOF
    set xdata time
    set timefmt "%H:%M:%S"
    set format x "%H:%M:%S"
    set title "Consumo de CPU y Memoria respecto al tiempo"
    set xlabel "t (s)"
    set ylabel "% "
    set grid
    plot "$log" using 1:2 with lines title "%CPU", \
         "$log" using 1:3 with lines title "%MEM"
EOF

       















