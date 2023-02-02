#include <iostream>
#include "Vector.h"
#include <random>

int main() {
	vector<int>numeros;
	numeros.rellenar(20, []()
		{
			std::random_device rd;
			std::mt19937 mt(rd());
			std::uniform_real_distribution<double>dist(1, 1000);
			return dist(mt);
		});
	std::cout << "Arreglo Desordenado" << std::endl;
	for (int numero : numeros) 
	{
		std::cout << numero << std::endl;
	}


	numeros.ordenar([](int a, int b) 
		{
			//a<b ascendente
			//b<a descendente
			return(a < b);
		});

	std::cout << "Arreglo Ordenado" << std::endl;
	numeros.recorrer([](int valor) 
		{
			std::cout << valor << std::endl;
			
		});
}