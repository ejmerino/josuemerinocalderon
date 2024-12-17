#include <iostream>
#include <omp.h>

using namespace std;

int main()
{
    int nhilos, tid, tid2, tid3, tid4;
    #pragma omp parallel private(tid)
    {
        tid = omp_get_thread_num();
        cout << "Hola mundo desde el hilo " << tid << endl;
        if (tid == 3) {
            nhilos = omp_get_num_threads();
            cout << "Numero de hilos " << nhilos << endl;
        }

        tid2 = omp_get_num_procs();
        cout << "Hola mundo desde el hilo " << tid2 << endl;
        if (tid2 == 3) {
            nhilos = omp_get_num_procs();
            cout << "Numero de hilos " << nhilos << endl;
        }

        tid3 = omp_set_num_threads();
        cout << "Hola mundo desde el hilo " << tid3 << endl;
        if (tid3 == 3) {
            nhilos = omp_set_num_threads();
            cout << "Numero de hilos " << nhilos << endl;
        }

        tid4 = omp_get_max_threads();
        cout << "Hola mundo desde el hilo " << tid4 << endl;
        if (tid4 == 3) {
            nhilos = omp_get_max_threads();
            cout << "Numero de hilos " << nhilos << endl;
        }
    }

    return 0;
}