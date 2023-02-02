/*
Crear un programa que pida dos numeros, de los cuales el num2 no puede ser menor al num1 
*/

#include <iostream>

using namespace std;

int main() {
	int num1 = 0;
	int num2 = 0;
	int contador = 0;
	do {
		cout << "Ingrese el valor del numero 1: ";
		cin >> num1;
		cout << endl;
		cout << "Ingrese el valor del numero 2: ";
		cin >> num2;
		cout << endl;

		if (num1>num2) {
			cout << "ERROR!" << endl;
			cout << "El numero " << num1 << " Es mayor que el numero " << num2 << endl << endl;
		}
	} while (num1 > num2);

	cout << "--------------" << endl<<endl<< "Numeros del " << num1 << " al numero " << num2 << endl << endl;
	for (int i = num1; i <= num2;i++) {
		cout << i <<" ";	
		cout << endl;
	}
	return 0;
}