/*
Crear un juego donde el jugador 1 debe insertar un numero y el jugador 2 debe adivinarlo,
en un máximo de 5 intentos.
*/

#include <iostream>

using namespace std;

int main() {
	int numero1 = 0, numero2 = 0, contador = 0;
	cout << "Jugador 1 ingrese un numero: ";
	cin >> numero1;
	cout << "Jugador 2 debe adivinar el numero del jugador 1" << endl << endl;

	do {
		cout << "Tienes " << (5 - contador) << " intentos, suerte!"<<endl;
		cout << "Jugador 2 ingrese el numero: ";
		cin >> numero2;
		cout << endl;
		if (numero1>numero2) {
			cout << "El numero que agrego es menor" << endl << endl;
		}
		else if (numero2>numero1){
			cout << "El numero que agrego es mayor" << endl << endl;
		}
		else {
			cout << "Has ganado" << endl;
		}

		contador++;
		if (contador == 5) {
			cout << "Usted ha superado el numero valido de intentos" << endl<<endl;
			system("pause");
		}
	} while (numero1 != numero2);

	return 0;
}