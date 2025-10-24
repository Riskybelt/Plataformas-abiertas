#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Hacemos que la funcion acepte argumentos desde la terminal

int main(int argc, char *argv[]) {

//verificamos la cantidad de argumentos ingresados

    if (argc != 4) {
        printf("Ingrese la cantidad correcta de argumentos\n");
        return 1;
    }
//Verificamos si se ingreso una palabra a cambiar

    if (strlen(argv[2]) == 0) {
        printf("No se ingreso la palabra que quire reemplazar.\n");
        return 1;
    }
//Abrimos los archivos de entrada y salida

    FILE *Arch_entrada = fopen(argv[1], "r");
    if (!Arch_entrada) { 
        printf("Error al abrir archivo"); 
        return 1; 
    }

    FILE *Arch_salida = fopen("prueba_modificads.txt", "w");
    if (!Arch_salida) { 
        printf("Error al crear el archivo"); 
        fclose(Arch_entrada); 
        return 1; 
    }
//Definimos la cantidad de carácteres maximos que va a poder leer el programa
 char linea[1024];
 
/* empleamos un while que permita leer linea por linea del archivo al que le queremos reemplazar palabras y
buscamos cada vez que se repita la palabra a reemplazar y la reemplazamos por la nueva*/
    while (fgets(linea, sizeof(linea), Arch_entrada)) {
        char *pos_actual = linea, *posicion;
        while ((posicion = strstr(pos_actual, argv[2])) != NULL) {
            fwrite(pos_actual, 1, posicion - pos_actual, Arch_salida);
            fputs(argv[3], Arch_salida);
            pos_actual = posicion + strlen(argv[2]);
        }
        fputs(pos_actual, Arch_salida);
    }
//Cerramos los archivos
   
    fclose(Arch_entrada);
    fclose(Arch_salida);
    return 0;
}
