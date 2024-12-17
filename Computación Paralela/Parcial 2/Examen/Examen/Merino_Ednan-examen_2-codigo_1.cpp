#include <iostream>
#include <omp.h>
#include <sys/time.h> //

using namespace std;

int main() {
    const int tamano = 100;
    int A[tamano][tamano], B[tamano][tamano], C[tamano][tamano], C2[tamano][tamano];
    for (int i = 0; i < tamano; ++i) {
        for (int j = 0; j < tamano; ++j) {
            A[i][j] = 0;
            B[i][j] = 0;
            C[i][j] = 0;
            C2[i][j] = 0;
        }
    }

    for (int i = 0; i < tamano; ++i) {
        for (int j = 0; j < tamano; ++j) {
            A[i][j] = j;
            B[i][j] = j;
        }
    }

    struct timeval t0, t1;
    gettimeofday(&t0, nullptr);

    for (int i = 0; i < tamano; i++) {
        for (int j = 0; j < tamano; j++) {
            for (int z = 0; z < tamano; z++) {
                C2[i][j] += A[i][z] * B[z][j];
            }
        }
    }

    gettimeofday(&t1, nullptr);
    double elapsed2 = (t1.tv_sec - t0.tv_sec) * 1.0 + (t1.tv_usec - t0.tv_usec) / 1000000.0;
    cout << "Tiempo secuencial: " << elapsed2 << " segundos" << endl;

    struct timeval t2, t3;
    gettimeofday(&t2, nullptr);

#pragma omp parallel for collapse(2)
    for (int i = 0; i < tamano; i++) {
        for (int j = 0; j < tamano; j++) {
            for (int z = 0; z < tamano; z++) {
#pragma omp atomic
                C2[i][j] += A[i][z] * B[z][j];
            }
        }
    }

    gettimeofday(&t3, nullptr);
    double elapsed = (t3.tv_sec - t2.tv_sec) * 1.0 + (t3.tv_usec - t2.tv_usec) / 1000000.0;
    cout << "Tiempo paralelo: " << elapsed << " segundos" << endl;

    return 0;
}
