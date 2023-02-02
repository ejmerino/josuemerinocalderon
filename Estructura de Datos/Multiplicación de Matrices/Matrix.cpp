#include "matrix.h"
 
// Constructor por defecto
template<typename T>
Matrix<T>::Matrix()
{
    m_rows = 4;
    m_cols = 4;
}
 
// Constructor copia
template<typename T>
Matrix<T>::Matrix(const Matrix &m)
{
    *this = m;
}
 
// Constructor por parámetro
template<typename T>
Matrix<T>::Matrix(int rows , int cols)
{
    m_cols = cols;
    m_rows = rows;
    m_matrix = new T*[m_rows];
 
    for (int i = 0; i < m_rows; i++) {
        m_matrix[i] = new T[m_cols];
    }
}
 
// Multiplicación de matrices con sobrecarga de operadores
template<typename T>
Matrix<T> Matrix<T>::operator* (const Matrix &matrix_2)
{
    Matrix matrix_result(m_rows, matrix_2.m_cols);
    T total;
 
    for (int i = 0; i < m_rows; i++) {
        for (int j = 0; j < matrix_2.m_cols; j++) {
            for (int k = 0; k < m_cols; k++) {
                total += (m_matrix[i][k] * matrix_2.m_matrix[k][j]);
            }
            matrix_result.m_matrix[i][j] = total;
 
            // Limpiar el total sumado arriba
            total = 0;
        }
    }
    return matrix_result;
}
 


template<typename T>
void Matrix<T>::delete_matrix()
{
    for (int i = 0; i < m_rows; i++) {
        delete[] m_matrix[i];
    }
    delete[] m_matrix;
}
 
// Llenar una Matriz desde teclado
template<typename T>
void Matrix<T>::fill_by_user()
{
    for (int i = 0; i < m_rows; i++) {
        cout << "Fila " << i + 1 << endl;
        for (int j = 0; j < m_cols; j++) {
            cout << "Ingresa el elemento " << j + 1 << endl;
            cin >> m_ele;
            m_matrix[i][j] = m_ele;
        }
        cout << endl;
    }
    
}
 
// Llenar aleatoriamente una Matriz
template<typename T>
void Matrix<T>::fill_random()
{
    for (int i = 0; i < m_rows; i++) {
        for (int j = 0; j < m_cols; j++) {
            m_matrix[i][j] = rand() % 30;
        }
    }
    srand(time(NULL));
}
 
// Imprimir Matriz
template<typename T>
void Matrix<T>::print_matrix()
{
    for (int i = 0; i < m_rows; i++) {
        for (int j = 0; j < m_cols; j++) {
            cout << m_matrix[i][j] << " ";
        }
        cout << endl << endl;
    }
    cout << endl << endl;
}
 
template<typename T>
Matrix<T>::~Matrix() {}
