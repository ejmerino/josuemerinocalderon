#include <iostream>
#include <omp.h>
#include <chrono>

using namespace std;

int main() {
	int const numHilos = 16;
	int idHilos = 0;
	omp_set_num_threads(numHilos);

	long numItera;
	double respuesta = 0.0;
	double sumParciales[numHilos];

	cout << "Programa con las Serie de Leibniz" << endl;
	cout << "Introduce el numero de iteraciones: ";
	cin >> numItera;

	auto start = chrono::high_resolution_clock::now();
#pragma omp parallel private(idHilos) shared(sumParciales)
	{
		idHilos = omp_get_thread_num();
		sumParciales[idHilos] = 0.0;

		for (long indice = idHilos; indice <= numItera; indice += numHilos) {
			if (indice % 2 == 0) {
				sumParciales[idHilos] += 4.0 / (2.0 * indice + 1.0);
			}
			else {
				sumParciales[idHilos] -= 4.0 / (2.0 * indice + 1.0);
			}
			//cout << "Hilo " << idHilos << " calcula la iteracion " << indice << endl;
		}
	}
	auto finish = chrono::high_resolution_clock::now();
	chrono::duration<double> elapsed = finish - start;
	cout << "Tiempo de ejecucion: " << elapsed.count() << " s\n";
	for (int i = 0; i < numHilos; i++) {
		respuesta += sumParciales[i];
	}
	cout << "Valor de pi: " << respuesta<< endl;
}