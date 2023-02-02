//Calcular la edad de una persona cuando en su cumpleaños en determinado año

#include <iostream>

using namespace std;

int main() {

	int edadA = 20;
	int edadF = 0;
	int fechaA = 2020;
	int fechaB = 2050;

	edadF = edadA + (fechaB - fechaA);
	cout << "En el año 2050 la edad sera de: " << edadF << endl;

	return 0;
}