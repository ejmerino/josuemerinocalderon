#include <iostream>
#include <cmath>
#include <chrono>
#include <omp.h>

using namespace std;
using namespace std::chrono;

double f(double x) {
    // Función a integrar
    return x * sin(x);
}

double simpson(double a, double b, int n) {
    double h = (b - a) / n; // Tamaño del intervalo
    double sum = f(a) + f(b); // Suma de los extremos

#pragma omp parallel shared(sum) // Inicio de la región paralela
    {
#pragma omp for
        for (int i = 1; i < n; i++) {
            double x = a + i * h;
            if (i % 2 == 0) {
#pragma omp atomic
                sum += 2 * f(x); // Términos pares
            }
            else {
#pragma omp atomic
                sum += 4 * f(x); // Términos impares
            }
        }
    }
    return (h / 3) * sum;
}

int main() {
    double a = 1.0; // Límite inferior
    double b = 4.0; // Límite superior
    int n = 24; // Número de subintervalos
    int num_threads = 8; // Número de hilos predefinido

    omp_set_num_threads(num_threads); // Establecer el número de hilos

    high_resolution_clock::time_point t1 = high_resolution_clock::now();

    double result = simpson(a, b, n);

    high_resolution_clock::time_point t2 = high_resolution_clock::now();
    
    auto duration = duration_cast<microseconds>(t2 - t1).count();

    cout << "El resultado de la integración es: " << result << endl;
    cout << "Tiempo de ejecución: " << duration << " microsegundos" << endl;
}