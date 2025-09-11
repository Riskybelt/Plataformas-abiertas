#!/bin/bash

#Elegimos un directorio a monitorear y lo ponemos en una variable para poder manipularlo

directorio="/home/morch/monitoreado" 

#Creo un archivo log donde se guarde el monitoreo del lirectorio, en este caso se va a guardar en la carpeta del respectibo lab 

log="/home/morch/laboratorios/lab_2/monitoreado.log"

#Usamos inotifywait para monitorear en tiempo real los cambios en nuestro directorio y agregamos esos cambios a un log mediante un append 
 
inotifywait -m -r --event create --event modify --event delete --format "%T %w %e %f" --timefmt "%Y-%m-%d %H:%M:%S" "$directorio" >> "$log"

