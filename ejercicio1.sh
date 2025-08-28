#!/bin/bash

# Numero de CPUs mediante el comando nproc

echo "1) El numero de CPUs es: "
nproc
echo " "

# RAM total disponible, legible para huamanos mediante el comandro free -h

echo "2) Informacion sobre la memoria RAM: "
free -h
echo " "

# Espacio libre en el disco, legible para humanos mediante el comando df -h

echo "3) Inforamcion sobre el disco: " 
df -h
echo " "

# Version del Kernel de Linux mediante el comando uname -r (-r busca la version del kernel)

echo "4) Informacion sobre el Kernel: "
uname -r
echo " "

# Tiempo de actividad del sistema mediante el comando uptime

echo "5) Informacion del tiempo de actividad del sistema: "
uptime 
echo " "

# Informacion completa sobre el sistema oprativo mediante el comando lsb_release -a 

echo "6) Informacion del sistema operativo: "
lsb_release -a  
echo " "

# Nombre del host del sistema mediante el comando hostname

echo "7) El host es: "
hostname

