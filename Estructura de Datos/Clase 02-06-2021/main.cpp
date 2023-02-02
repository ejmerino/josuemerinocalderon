
/* Universidad de las Fuerzas Armadas - ESPE
   Software
   Autores:
   -Merino Josu�
   Enunciado del Problema: Memoria din�mica
   Fecha de creaci�n: 02/06/2021
   Fecha de modificaci�n: 02/06/2021
*/
#include <iostream>
#include <stdlib.h>
#include <conio.h>
#include <stdio.h>
using namespace std;
int **segmentar(int);
void encerar(int **,int);
void ingresar(int**, int);
void calcular(int**, int**,int**, int);
void imprimir(int**, int);

int **segmentar(int dim){
    int **matriz,j;
    matriz=(int **)malloc(dim*sizeof(int *));
    for(j=0;j<dim;j++){
        *(matriz+j)=(int *)malloc(dim*sizeof(int));
    }
     return matriz;
}
void encerar(int **matriz,int dim){
    int i,j;
     for(i=0;i<dim;i++)
       for(j=0;j<dim;j++)
        *(*(matriz+i)+j)=0;
}
void ingresar(int **matriz, int dim){
    int i,j;
    for(i=0;i<dim;i++)
    for(j=0;j<dim;j++)
        scanf("%d",&(*(*(matriz+i)+j)));

}
void calcular(int **matriz1, int **matriz2,int **matrizR, int dim){
    int i,j,k;
    for(i=0;i<dim;i++){
        for(j=0;j<dim;j++){
            for(k=0;k<dim;k++){
              *(*(matrizR+i)+j)=*(*(matrizR+i)+j) + *(*(matriz1+i)+k) * *(*(matriz2+k)+j);
            }
        }
    }
}
void imprimir(int **matriz, int dim){
    int i,j;
    for(i=0;i<dim;i++){
        for(j=0;j<dim;j++){
            printf("%d",*(*(matriz+i)+j));
            printf("%*s",j+5,"");
        }
        printf("\n");
    }

}
int main()
{
    int dim;
    int **mat1, ** mat2, **matR;
    printf("\nIngrese la dimensi�n :");
    scanf("%d",&dim);
    mat1=segmentar(dim);
    mat2=segmentar(dim);
    matR=segmentar(dim);
    encerar(mat1,dim);
    encerar(mat2,dim);
    encerar(matR,dim);
    ingresar(mat1, dim);
    ingresar(mat2, dim);
    printf("\n");
    imprimir(mat1,dim);
    printf("\n");
    imprimir(mat2,dim);
    printf("\n");
    calcular(mat1,mat2,matR,dim);
    imprimir(matR,dim);

    return 0;
}
