#include "Operaciones.h"
#include <stdlib.h>

void Operaciones::encerar(int vec[10]){
	for(int i=0; i<10;i++){
		vec[i]=0;
	}
}

void Operaciones::ingresar(int vec[10]){
	for(int i=0; i<10;i++){
		vec[i]=rand()%11;
	}
}

float Operaciones::procesar(int vec[10]){
	float promedio=0.0f;
	for(int i=0; i<10;i++){
		promedio+=vec[i];;
	}
	return promedio/10.0f;
}

void Operaciones::imprimir(int vec[10]){
	for(int i=0; i<10;i++){
		std::cout<<vec[i]<<std::endl;
	}
}
