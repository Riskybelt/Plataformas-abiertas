#!/bin/bash
 
echo "Verificando si usuario es root" 

echo

#Verificamos si el usuario es root, si no lo es tira el resultado a sterr y termina el script ,si lo es, sigue el script sin problemas

if [[ $(id -u) -ne 0 ]]; then 
	echo "Error,su usuario no es root" >&2 
exit 1

fi 

echo "Usuario root"
#

Nombre=$1 

Grupo=$2

Ruta=$3 


#Como en el primer laboratorio, verificamos que se pasen 3 argumentos como minimo

if [[ $# -ne 3 ]]; then
       echo "Error de argumentos, Ingrese: <usuario> <grupo> <ruta_archivo>" >&2
exit 1

fi

#Verificamos que la ruta de archivo exista, si no existe imprimimos log, si existe continuamos

if [[ ! -f $Ruta ]]; then
	echo "Error: $0 $Nombre $Grupo $Ruta / $Ruta no existe." >&2
exit 1 

fi 


#Verificamos si existe el grupo, si no existe lo crea, si existe lo indica. 

#Investigando como hacer esta parte, hay muchas opciones, unas mas complicadas que otra ya que muchas evitan problemas en diversos sistemas, sin embargo se decidio utilizar el comando "getent" que busca la informacion que se le indico en el sistema. Lo mandamos a /dev/null para no imprimir informacion adiciona

if getent group "$Grupo" &> /dev/null; then
       echo "$0 $Nombre $Grupo $Ruta / $Grupo ya existe"

else 
	groupadd "$Grupo"
	echo "$0 $Nombre $Grupo $Ruta / $Grupo creado"
fi 

#Verificamos que un usuario existe usando id y lo mandamos a /dev/null para no imprimir informacion adicional

if id "$Nombre" &> /dev/null; then 
	 echo "$0 $Nombre $Grupo $Ruta / $Nombre ya existe"

#Agregamos el usuario existente al grupo con user mod -a, usamos -G para agregarlo al grupo dado sin cambiarlo de los otros grupos a los que pertenece
	 
	 usermod -aG "$Grupo" "$Nombre" 

else 

#Creamos un usuario nuevo y lo agregamos al grupo dado como en el proceso anterior
	useradd -G "$Grupo" "$Nombre"

	echo "$0 $Nombre $Grupo $Ruta / $Nombre creado"
fi

#Cambiamos el archivo dado a nuestro grupo y usuario mediante el comando chown.  

chown "$Nombre":"$Grupo" "$Ruta" 

#Modificamos los permisos del archivo para que el usuario tenga permisos de lectura, escritura y ejecucion, grupo solo lectura y el resto ninguno mediante notacion octal. 

chmod 740 "$Ruta" 






