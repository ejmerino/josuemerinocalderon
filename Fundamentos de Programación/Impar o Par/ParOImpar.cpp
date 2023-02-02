/*Determinar si un numero es par o impar*/

#include <iostream>
using namespace std;

int main() {
	int numA;
	int resto;

	cout << "ingrese un numero: ";
	cin >> numA;

	resto = numA % 2;
	if (resto==0) {
		cout << "El numero es par" << endl;
	}
	else {
		cout << "El numero es impar" << endl;
	}
	return 0;
}