#include <omp.h>
#include <iostream>
#include <sys/time.h>
#include <unistd.h>

struct timeval t0, t1;
double tej;

double func(int N)
{
    usleep(10000);
    if (N == 1)
    {
        return 1;
    }
    else if (N == 2)
    {
        return 2;
    }
    else if (N == 3)
    {
        return 3;
    }
    return 0;
}

int main()
{
    int NA = 1, NB = 2, NC = 3;
    double A, B, C, D;


#pragma omp parallel
    {
#pragma omp sections
        {
#pragma omp section
            {
                A = func(NA);
            }
#pragma omp section
            {
                B = func(NB);
            }
#pragma omp section
            {
                C = func(NC);
            }
        }
    }

    D = A + B + C;

    gettimeofday(&t1, nullptr);

    printf("\n Resultados A = %.2f, B = %.2f, C = %.2f ---> D = %.2f", A, B, C, D);

    tej = (t1.tv_sec - t0.tv_sec) + (t1.tv_usec - t0.tv_usec) / 1e6;
    printf("\n\nT. de ejec = %1.3f ms\n\n", tej * 1000);

    return 0;
}
