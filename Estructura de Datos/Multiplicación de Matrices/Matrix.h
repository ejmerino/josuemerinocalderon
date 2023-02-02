#ifndef MATRIX_H
#define MATRIX_H
 
#include <iostream>
#include <time.h>
#include <stdlib.h>
 
using namespace std;
 
template <class T>
class Matrix {
    public:
        Matrix();
        Matrix(int, int);
        Matrix(const Matrix &m);
        ~Matrix();
 
        Matrix<T> operator* (const Matrix &matrix_2);        
 
        void delete_matrix();
        void fill_by_user();
        void fill_random();
        void print_matrix();
        
 
    private:
        T **m_matrix;
        int m_ele;
        int m_cols;
        int m_rows;
};
 
#endif // MATRIX_H
