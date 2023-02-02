/*
Crear un programa que calcule el promedio general de un salon de clases, no se conoce el
numero de alumnos, el programa debe darle la opcion al maestro para que él pueda decidir
si desea agregar mas datos de alumnos o ya ha terminado
*/

#include <iostream>

using namespace std;

int main() {

	char continuar = 'S';
	float nota = 0, promedio = 0;
	int contador = 0;

	while (continuar == 'S' || continuar == 's') {
		cout << "Ingrese la nota del alumno: ";
		cin >> nota;

		promedio += nota;

		cout << "Desea continuar(S/N): ";
		cin >> continuar;

		contador++;
	}
	promedio = promedio / contador;
	cout << "El promedio de los " << contador << " alumnos es: " << promedio<<"/10";
	return 0;
}