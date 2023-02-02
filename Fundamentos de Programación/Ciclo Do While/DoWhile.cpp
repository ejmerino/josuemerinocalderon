/*
Crear un ciclo Do While, ingrese datos hasta que se agregue el número 0
*/

#include <iostream>

using namespace std;
int main() {
	int numero=0;

	do {
		cout << "Ingrese un numero" << endl;
		cin >> numero;
	} while (numero!=0);

	cout << "El Ciclo ha terminado!";
	return 0;
}