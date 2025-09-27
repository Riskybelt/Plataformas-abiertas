#include <stdio.h>

int factorial (int n) {
    int i = 1;
    while (n>1){
        i= i*n;
        n=n-1;
    }
    return i;

}

int main (int argc, char *argv []){
/*basta con declarar una variable donde se guarde el input del usuario mediante scanf 
y evaluar esa variable en la funcion factorial para que ese sea el factorial calculado.
se hizo con un solo factorial ya que las instrucciones no especifican calcular más de uno.
*/
    int fact1= 0;
    printf("ingrese el factorial que desea calcular: ");
    scanf("%d", &fact1);

    int fac = factorial (fact1);
    printf("%d! = %d.\n", fact1, fac);

    
    return 0;
}