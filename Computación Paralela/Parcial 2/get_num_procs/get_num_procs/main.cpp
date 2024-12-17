#include <iostream>
#include <omp.h>

int main() {
    int num_procs;

    // Obtener el número de procesadores lógicos disponibles
#pragma omp parallel
    {
#pragma omp single
        {
            num_procs = omp_get_num_procs();
            std::cout << "Número de procesadores lógicos: " << num_procs << std::endl;
        }
    }

    return 0;
}
