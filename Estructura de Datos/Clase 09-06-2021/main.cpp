/* Universidad de las Fuerzas Armadas - ESPE
   Software
   Autores:
   -Merino Josu�
   Enunciado del Problema: Listas 
   Fecha de creaci�n: 09/06/2021
   Fecha de modificaci�n: 09/06/2021
*/

#include <iostream>
#include "Lista.h"

using namespace std;

int main(int argc, char** argv) 
{
	Lista lst;
	lst.insertar(1);
	lst.insertar(2);
	lst.insertar(3);
	lst.insertar(4);
	lst.insertar(5);
	lst.insertar(6);
	lst.mostrar();
	return 0;
}
