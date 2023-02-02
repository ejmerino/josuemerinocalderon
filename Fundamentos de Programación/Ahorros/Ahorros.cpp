/*Desarrollar un programa en el que se vea si cada mes se puede o no ahorrar para comprar
Un televisor*/

#include <iostream>

using namespace std;

int main() {
	float ingresos, seguro, comida, internet, ropa, casa, ahorro,gastos;
	cout << "Digite sus ingresos: $";
	cin >> ingresos;
	cout << "Ingrese lo que paga al seguro: $";
	cin >> seguro;
	cout << "Ingrese lo que paga de comida: $";
	cin >> comida;
	cout << "Ingrese lo que de internet: $";
	cin >> internet;
	cout << "Ingrese lo que paga de ropa: $";
	cin >> ropa;
	cout << "Ingrese lo que paga de casa: $";
	cin >> casa;

	gastos = seguro + comida + internet + ropa + casa;
	ahorro = ingresos - gastos;
	if (ahorro >= 50.00) {
		cout << endl << "Usted tiene ahorros este mes"<< endl;
	} else {
		cout <<endl<< "Usted no tiene ahorros este mes" << endl;
	}
	return 0;
}