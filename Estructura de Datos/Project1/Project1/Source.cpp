#include <conio.h>
#include <iostream>
#include <string.h>

using namespace std;
int main() {
	int numero;
	cout << "Introduce un numero: ";
	cin >> numero;
	if (numero % 2 == 0)
		cout << "PAR";
	else
		cout << "IMPAR";
	_getch();
}