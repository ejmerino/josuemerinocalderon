#include <iostream>
#include <stdlib.h>
#include <time.h>
//A=f*c
//B=f*c
//c=f;

using namespace std; 

int main(int argc, char** argv) {
	srand(time(NULL));
	int A[20][20], B[20][20], C[20][20];
    int k, m, n;

    cout<<"Lectura de matriz A."<<endl;
    cout<<"Filas de A: "; cin>>k;
    cout<<"Columnas de A: "; cin>>m;
    cout<<endl;
    for(int i=0; i<k; ++i)
        for(int j=0; j<m; ++j)
        {
  			A[i][j] = 1 + rand() % (11 - 1);
        }

    cout<<"Lectura de matriz B."<<endl;
    cout<<"Filas de B: "<<m<<" (ya esta definido y es necesario)."<<endl;
    cout<<"Columnas de B: "; cin>>n;
    cout<<endl;
    for(int i=0; i<m; ++i)
        for(int j=0; j<n; ++j)
        {
            B[i][j] = 1 + rand() % (11 - 1);
        }

    // Inicializamos la matriz C.
    for(int i=0; i<k; ++i)
        for(int j=0; j<n; ++j)
            C[i][j] = 0;

    // Generamos la matriz C.
    for(int i=0; i<k; ++i)
        for(int j=0; j<n; ++j)
            for(int z=0; z<m; ++z)
                C[i][j] += A[i][z] * B[z][j];

    cout<<"Matriz A: "<<endl;
    for(int i=0; i<k; ++i)
    {
        for(int j=0; j<m; ++j)
        {
            cout<<A[i][j]<<" ";
        }
        cout<<endl;
    }
	cout<<endl;
    cout<<"Matriz B: "<<endl;
    for(int i=0; i<m; ++i)
    {
        for(int j=0; j<n; ++j)
        {
            cout<<B[i][j]<<" ";
        }
        cout<<endl;
    }
	cout<<endl;
    cout<<"Matriz Resultante: "<<endl;
    for(int i=0; i<k; ++i)
    {
        for(int j=0; j<n; ++j)
        {
            cout<<C[i][j]<<" ";
        }
        cout<<endl;
    }

	return 0;
}
