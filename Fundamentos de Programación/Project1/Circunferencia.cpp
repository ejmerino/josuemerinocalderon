//Hallar el perimetro de una circunferencia que tenga un radio R, C=2*PI*R, PI=3.1416

#include <iostream>

using namespace std;

int main() {
	int R;
	float PI = 3.1416;
	float resultado;
	R = 12;
	resultado = 2 * PI * R;
	cout << "La longitud de la circunferencia es: " << resultado << endl;
	return 0;
}