/*Crear un programa que pida la edad, sexo y ciudad de una persona e imprima si es menor de edad*/

#include <iostream>

using namespace std;

int main() {
	int edad;
	string sexo;
	string ciudad;

	cout << "Ingrese su edad: ";
	cin >> edad;
	cout << "Ingrese su sexo: ";
	cin >> sexo;
	cout << "Ingrese su ciudad: ";
	cin >> ciudad;

	if (edad >= 18) {
		cout << "Usted es mayor de edad"<<endl;
		cout << "Usted tiene: " << edad << " anos" << endl;
		cout << "Su sexo es: " << sexo << endl;
		cout << "Su ciudad es: " << ciudad << endl;
	}
	else {
		cout << "Usted es menor de edad";
	}
}