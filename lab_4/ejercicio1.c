#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define Filas 3
#define Columnas 3

/*Reciclamos el codigo del lab anterior para que la matriz se llene sola y no tener
que llenar una nueva con cada prueba*/


int main() {
//Definimos donde se guardaraon los numeros generados por el rand y la matriz donde se guardaran
    int matriz[Filas][Columnas];
    int numeros[Filas * Columnas];
//Declaramos los punteros a utilizar
    int *ptrMatriz = &matriz[0][0];
    int *ptrVector = numeros;

/*Definimos la semilla que generará los numeros y añadimos el time (null)
ya que investigando me di cuenta que si no se agrega no generará numeros nuevos con cada
ejecucion del programa, entonces es una forma facil de lograrlo*/

 srand(time(NULL));

 // Llenamos la matriz con números aleatorios del 1 al 9 para no tener numeros muy feos

    for (int i = 0; i < Filas; i++) {
        for (int j = 0; j < Columnas; j++) {
            matriz[i][j] = rand() % 9 + 1; 
        }
    }
    

    printf("la matriz corresponde a:\n");
    for (int i = 0; i < Filas; i++) {
        for (int j = 0; j < Columnas; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

//convertimos la matriz en un vector con los punteros
    printf("Vector:\n");
for (int i = 0; i < Filas * Columnas; i++) {
    *(ptrVector + i) = *(ptrMatriz + i);
}


return 0;
}