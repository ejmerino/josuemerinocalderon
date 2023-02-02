/*
Calcular la suma de los numeros entre 1 y un numero ingresado por el usuario y 
compruebe su suma mediante la fórmula n(n+1)/2
*/

#include<iostream>

using namespace std;

int main() {
	int suma = 0;
	int n = 0;
	int i = 1;

	cout << "Ingrese un numero hasta el cual se sumara: ";
	cin >> n;
	cout << endl<< "Los numeros entre 1 y " << n << " son: " << endl << endl;
	for (i = 1; i <= n;i++) {		
		cout << i<<" ";
		suma += i;		
	}
	cout << endl;
	cout << endl<< "La suma desde 1 hasta " << n << " es: " << suma << endl << endl;

	cout << "-----------------------------------------" << endl << endl;
	cout << "Comprobacion mediante la formula "<<n<<"*"<<"("<<n<<"+1)/2 es: " << (n * (n + 1) / 2);
	cout << endl;

	return 0;
}