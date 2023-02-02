/*
Crear una calculadora en la que se introduzcan dos datos tipo float y una operacion
(+,-,*,/)
*/

#include <iostream>

using namespace std;

int main() {
	float a, b,suma,resta,multiplicacion,division,modulo;
	int operacion;
	cout << "CALCULADORA BASICA" << endl;
	cout << endl;
	cout << "Ingrese el primer numero : ";
	cin >> a;
	cout << endl;
	cout << "Ingrese el segundo numero: ";
	cin >> b;
	cout << endl;
	cout << "Las operaciones son: " << endl<<"1.- Suma" << endl << "2.- Resta" << endl 
		<< "3.- Multiplicacion"<< endl << "4.- Division" << endl ;
	cout << endl;
	cout << "Ingrese la operacion a realizarse: ";
	cin >> operacion;

	switch (operacion) 
	{
	case 1:
		cout << "Eligio Suma" << endl;
		suma = a + b;
		cout << "El resultado de " << a << " + "<<b<<" = "<< suma << endl;
	break;
	case 2:
		cout << "Eligio Resta" << endl;
		resta = a - b;
		cout << "El resultado de " << a << " - " << b << " = " << resta << endl;
	break;
	case 3:
		cout << "Eligio Multiplicacion" << endl;
		multiplicacion = a * b;
		cout << "El resultado de " << a << " * " << b << " = " << multiplicacion << endl;
	break;
	case 4:
		cout << "Eligio Division" << endl;
		division = a / b;
		cout << "El resultado de " << a << " / " << b << " = " << division << endl;
	break;
	default:
		cout << "No eligio una opcion correcta!" << endl;
	break;
	}
}