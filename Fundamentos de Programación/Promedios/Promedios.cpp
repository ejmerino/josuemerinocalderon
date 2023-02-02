//Construir un programa que calcule el promedio de 3 notas

#include <iostream>

using namespace std;

int main() {
	float notaA=9.87;
	float notaB=10.00;
	float notaC=6.78;
	float promedio;

	promedio = (notaA + notaB + notaC) / 3;
	cout << "El promedio es: " << promedio << endl;
	return 0;
}