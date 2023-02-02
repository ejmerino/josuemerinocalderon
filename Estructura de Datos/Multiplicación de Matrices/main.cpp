#include <iostream>
#include "matrix.h"
#include "matrix.cpp"
 
using namespace std;
 
int main()
{
    // Para no generar los mismos números aleatorios
    srand(time(NULL));
 
    int n_rows;
    int n_cols;
 
    int col_1;
    int col_2;
    int row_1;
    int row_2;
    int scalar;
 
    cout << "Ingresa el numero de filas: " << endl;
    cin >> n_rows;
    cout << "Ingresa el numero de columnas: " << endl;
    cin >> n_cols;
    cout << endl;
 
    Matrix<int> a(n_rows, n_cols);
    Matrix<int> b(n_rows, n_cols);
 
    // Matriz para almacenar el resultado de las operaciones
    Matrix<int> c(n_rows, n_cols);
 
    a.fill_random();
    b.fill_random();
           
    cout << "Matriz A: " << endl;
    a.print_matrix();
 
    cout << "Matriz B: " << endl;
    b.print_matrix();    
 
    cout << "Matriz A * B: " << endl;
    c = a * b;
    c.print_matrix();
 
    a.delete_matrix();
    b.delete_matrix();
    c.delete_matrix();
 
    return 0;
}
