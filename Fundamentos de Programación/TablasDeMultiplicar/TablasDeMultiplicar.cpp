/*
Hacer tablas de multiplicar con menu
*/

#include <iostream>

using namespace std;

int main() {
	int opcion=0,n=0;
	int multiplicacion = 0;
	int contador = 0;

	cout << "Ingrese que tabla de multiplicar quiere ver: " << endl;
	cout << "1.- Tabla del 1" << endl;
	cout << "2.- Tabla del 2" << endl;
	cout << "3.- Tabla del 3" << endl;
	cout << "4.- Tabla del 4" << endl;
	cout << "5.- Tabla del 5" << endl;
	cout << "6.- Tabla del 6" << endl;
	cout << "7.- Tabla del 7" << endl;
	cout << "8.- Tabla del 8" << endl;
	cout << "9.- Tabla del 9" << endl;
	cout << "10.- Tabla del 10" << endl;
	cout << "Dijite la opcion: ";
	cin >> opcion;
	switch (opcion) {
	case 1:
		cout << "Hasta que numero desea que se imprima la tabla: ";
		cin >> n;
		for (int i = 1;i<=n; i++) {
			cout << i <<endl;
			cout << i << " por " << contador++;
			multiplicacion = i*n;
			contador++;
		}
	break;
	case 2:
		cout << "Hasta que numero desea que se imprima la tabla: ";
		cin >> n;
		
		contador++;
		break;

	}

	
}