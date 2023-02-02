/*
Crear un ciclo while que pare cuando se ingrese un numero fuera del limite
*/

#include <iostream>

using namespace std;

int main() {
	int numero = 0;

	cout << "El bucle seguira mientras no se ingrese un dato mayor a 100 o menor a 0" << endl;

	while (numero >= 0 && numero <= 100) {
		cout << "Ingrese un numero: ";
		cin >> numero;
	}

	cout << "El ciclo ha finalizado!";
	return 0;
}