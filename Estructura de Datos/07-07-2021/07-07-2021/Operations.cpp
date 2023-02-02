#include "Operations.h"
#include <iostream>
#include <stdlib.h>
#include <random>

void Operations::generar(Vector vector, int tam) 
{
	vector.setArreglo(new int[tam]);
	int random = 0;
	std::random_device rd;
	std::mt19937 mt(rd());
	std::uniform_real_distribution<double>motor(1, 1000);	
	for (int i = 0; i<tam; i++) 
	{
		random = motor(mt);
		*(vector.getArreglo() + i) = random;
	}		
}

void Operations::imprimir(Vector vector, int tam) 
{
	for (int i = 0; i < tam; i++) 
	{
		std::cout << *(vector.getArreglo() + i) << std::endl;
	}
	
}

void Operations::ordenar(Vector vector, int tam) 
{
	int temp;
	int* tempGet = vector.getArreglo();
	for (int i = 0; i < tam; i++) 
	{
		for (int j = i + 1; j < tam; j++) 
		{
			if (*(tempGet + j) < *(tempGet + i))
			{
				temp = *(tempGet + 1);
				*(tempGet + i) = *(tempGet + j);
				*(tempGet + j) = temp;
			}
				
		}
			
	}
}