#include<iostream>
#include<cmath>
#include<chrono>
using namespace std;
using namespace std::chrono;

double f(double x)
{
    return x * sin(x);
}

double simpson(double a, double b, int n)
{
    double h, sum = 0;
    double* x = new double[n + 1];
    int j;
    h = (b - a) / n;

    x[0] = a;

    for (j = 1; j <= n; j++)
    {
        x[j] = a + h * j;
    }

    for (j = 1; j <= n / 2; j++)
    {
        sum += f(x[2 * j - 2]) + 4 * f(x[2 * j - 1]) + f(x[2 * j]);
    }

    delete[] x;
    return sum * h / 3;
}

int main()
{
    double a, b;
    int n;
    a = 1;
    b = 4;
    n = 16;

    if (n % 2 == 0)
    {
        auto start = high_resolution_clock::now(); // Iniciar el cronómetro
        double result = simpson(a, b, n);
        auto stop = high_resolution_clock::now(); // Detener el cronómetro
        auto duration = duration_cast<microseconds>(stop - start); // Calcular la duración en microsegundos

        cout << "Resultado: " << result << endl;
        cout << "Tiempo de ejecución: " << duration.count() << " microsegundos" << endl;
    }
    else
    {
        cout << "n debería ser un número par";
    }

    return 0;
}
