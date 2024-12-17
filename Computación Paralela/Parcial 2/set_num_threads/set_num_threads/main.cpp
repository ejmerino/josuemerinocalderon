#include <iostream>
#include <omp.h>

int main() {
    int num_threads = 4;
    omp_set_num_threads(num_threads);

#pragma omp parallel
    {
        int thread_id = omp_get_thread_num();
#pragma omp critical
        std::cout << "Hola desde hilo " << thread_id << std::endl;
    }

    return 0;
}
