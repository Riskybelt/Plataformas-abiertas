#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define SIZE 3
//declaramos una funcion que verifique la matriz base
void verificar_matriz_base() {
    int matriz[SIZE][SIZE] = {
        {2, 7, 6},
        {9, 5, 1},
        {4, 3, 8}
    };

    // Calcular la constante mágica de cada matriz y declaramos una variable que funciona como booleano
    int constante_magica = (SIZE * (SIZE * SIZE + 1)) / 2;
    int verificacion= 1;

    // Verificamos si las filas cumple la condicion de cuadrado magico
    for (int i= 0; i< SIZE; i++){
        int sumaF= 0;
        for (int j= 0; j< SIZE; j++){
        sumaF += matriz[i][j];}
        if (sumaF != constante_magica)
        verificacion= 0;
    }


// Verificamos si las columnas cumplen la condicion de cuadrado magico
    for (int j= 0; j< SIZE; j++){
        int sumaC= 0;
        for (int i= 0; i< SIZE; i++){
        sumaC += matriz[i][j];}
        if (sumaC != constante_magica)
        verificacion= 0;
    }
    
// Verificamos si las diagonales cumplen la condicion de cuadrado magico
    int diag1 = 0, diag2 = 0;
    for (int i = 0; i < SIZE; i++) {
        diag1 += matriz[i][i];
        diag2 += matriz[i][SIZE - 1 - i];
    }
    if (diag1 != constante_magica || diag2 != constante_magica)
        verificacion = 0;

// imprimimos la matriz solo para que se vea bonito

    printf("la matriz utilizada corresponde a:\n");
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    printf("\n");
/* hacemos un condicional que imprima si la matriz es magica o no, usando la variable
que utilizamos como booleano */

    if (verificacion== 1){
    printf("la matriz es un cuadrado magico");}


    else{
        printf( "la matriz no es un cuadrado magico");}

    printf("\n");
    printf("\n");
    }

//declaramos una funcion que cree y verifique matrices aleatorios
void matriz_aleatoria() {
//Definimos donde se guardaraon los numeros generados por el rand y la matriz donde se guardaran
    int matriz[SIZE][SIZE];
    int numeros[SIZE * SIZE];

/*Definimos la semilla que generará los numeros y añadimos el time (null)
ya que investigando me di cuenta que si no se agrega no generará numeros nuevos con cada
ejecucion del programa, entonces es una forma facil de lograrlo*/

 srand(time(NULL));

 // Llenamos la matriz con números aleatorios del 1 al 9 para no tener numeros muy feos

    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matriz[i][j] = rand() % 9 + 1; 
        }
    }


    // Calculamos la constante mágica de cada matriz y declaramos una variable que funciona como booleano
    int constante_magica = (SIZE * (SIZE * SIZE + 1)) / 2;
    int verificacion= 1;

    // Verificamos si las filas cumple la condicion de cuadrado magico
    for (int i= 0; i< SIZE; i++){
        int sumaF= 0;
        for (int j= 0; j< SIZE; j++){
        sumaF += matriz[i][j];}
        if (sumaF != constante_magica)
        verificacion= 0;
    }


// Verificamos si las columnas cumplen la condicion de cuadrado magico
    for (int j= 0; j< SIZE; j++){
        int sumaC= 0;
        for (int i= 0; i< SIZE; i++){
        sumaC += matriz[i][j];}
        if (sumaC != constante_magica)
        verificacion= 0;
    }
    
// Verificamos si las diagonales cumplen la condicion de cuadrado magico
    int diag1 = 0, diag2 = 0;
    for (int i = 0; i < SIZE; i++) {
        diag1 += matriz[i][i];
        diag2 += matriz[i][SIZE - 1 - i];
    }
    if (diag1 != constante_magica || diag2 != constante_magica)
        verificacion = 0;

// imprimimos la matriz solo para que se vea bonito

    printf("la matriz aleatoria utilizada corresponde a:\n");
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%d ", matriz[i][j]);
        }
        printf("\n");
    }

    printf("\n");
/* hacemos un condicional que imprima si la matriz es magica o no, usando la variable
que utilizamos como booleano */

    if (verificacion== 1){
    printf("la matriz aleatoria es un cuadrado magico");}


    else{
        printf( "la matriz aleatoria no es un cuadrado magico");}

    printf("\n");
    printf("\n");
    }

//Llamamos a ambas funciones en el main para que se ejecuten ambos codigos
int main() {
    verificar_matriz_base();
    matriz_aleatoria();
    return 0;
}
