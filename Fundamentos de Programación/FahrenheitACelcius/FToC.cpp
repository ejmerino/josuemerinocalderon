//Crear un programa que transforme de grados Fahrenheit a grados celcius
//C=(5/9)*(F-32)

#include <iostream>

using namespace std;

int main() {
	float Fahrenheit,resultado;
	cout << "Ingrese los grados Fahrenheit: ";
	cin >> Fahrenheit;
	resultado = (5 / 9) * (Fahrenheit - 32); 
	
	cout << "Los Grados en Celcius son: " << resultado << "°"<< endl;
	cin >> resultado;
	return 0;
}