/*Muestre el listado de los posibles colores en los que puede estar un semaforo
con sus numeros asociados*/

#include <iostream>

using namespace std;

int main() {
	int semaforo;
	cout << "En que color esta el semaforo?" << endl;
	cout << "Rojo=1" << endl << "Verde=2" << endl << "Amarillo=3" << endl;
	cout << "Dijite la opcion(1,2,3): ";
	cin >> semaforo;

	if (semaforo == 1) {
		cout << "NO PASAR!" << endl << "El semaforo esta en Rojo";
	}
	else if (semaforo == 2) {
		cout << "Adelante!" << endl << "El semaforo esta en Verde";
	}
	else if(semaforo==3){
		cout << "Precaucion" << endl << "El semaforo esta en Amarillo";
	}

	return 0;
}