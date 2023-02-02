/*
Calcule el aumento de sueldo para un trabajador segun su categoria
Categoria 1=(+15%)
Categoria 2=(+10%)
Categoria 3=(+05%)
*/

#include <iostream>

using namespace std;

int main() {
	int categoria;
	float sueldo, aumento, sueldoN;
	cout << "Capture la categoria del trabajador: ";
	cin >> categoria;
	cout << "Capture el sueldo del trabajador: $";
	cin >> sueldo;

	switch (categoria) {
	case 1:
		cout << "El trabajador es de categoria 1" << endl;
		aumento = sueldo * .15;
		sueldoN = sueldo + aumento;
		cout << "El nuevo sueldo del trabajador es: $" << sueldoN << endl;
	break;
	case 2:
		cout << "El trabajador es de categoria 2" << endl;
		aumento = sueldo * .10;
		sueldoN = sueldo + aumento;
		cout << "El nuevo sueldo del trabajador es: $" << sueldoN << endl;
	break;
	case 3:
		cout << "El trabajador es de categoria 3" << endl;
		aumento = sueldo * .05;
		sueldoN = sueldo + aumento;
		cout << "El nuevo sueldo del trabajador es: $" << sueldoN << endl;
	break;
	default:
		cout << "No ingreso el dato correctamente";
	break;
	}
	return 0;
}