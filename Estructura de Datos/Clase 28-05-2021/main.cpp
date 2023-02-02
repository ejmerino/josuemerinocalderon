#include <iostream>
#include "Operaciones.h"

int main(int argc, char** argv) {
	Operaciones operaciones;
	int vector [10];
	std::cout<<"El vector es: ";
	operaciones.encerar(vector);
	operaciones.ingresar(vector);
	operaciones.procesar(vector);
	operaciones.imprimir(vector);
	return 0;
}
