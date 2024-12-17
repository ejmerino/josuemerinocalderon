#include <iostream>
#include <ctime>

using namespace std;

int main() 
{
	unsigned t1, t0;
	int numItera;
	double respuesta = 0.0;

	cout << "Programa con las Series de Leibniz - Secuencial\n\n";

	cout << "Ingrese el numero de iteraciones para aproximación: ";
	cin >> numItera;

	bool esIndicePar = true;
	t0=clock();
	for(long indice=0; indice <= numItera; indice++)
	{
		if(esIndicePar ==true){
		
			respuesta += 4.0 / (2.0 * indice + 1.0);
		}
		else
		{
			respuesta -= 4.0 / (2.0 * indice + 1.0);
		}
		esIndicePar = !esIndicePar;
	}
	t1 = clock();
	double time = (double(t1 - t0)) / CLOCKS_PER_SEC;
	cout << "El Valor de PI aproximado es: " << respuesta << endl;
	cout<<"Tiempo de ejecución: "<<time << "segundos" <<endl<< endl;
	
	return 0;
}