/*
Universidad de las Fuerzas Armadas - ESPE
Nombres: Jhoel Chicaiza, Josué Merino
Fecha: 08 de junio del 2023
Tema: Proyecto Final
Parcial: 1
*/

#include <iostream>
#include <vector>
#include <string>
#include "karnaugh.h"

int main() {
    std::cout << "Mapa de Karnaugh por Jhoel Chicaiza y Josue Merino\n";
    int numVariables;
    std::cout << "\nIngrese el numero de variables: ";
    std::cin >> numVariables;

    std::vector<int> unos;
    std::vector<int> ceros;

    int num_filas = std::pow(2, numVariables - numVariables / 2);
    int num_columnas = std::pow(2, numVariables / 2);

    std::cout << "\nPor favor, Ingrese los valores en el mapa de Karnaugh" << std::endl;

    for (int fila = 0; fila < num_filas; ++fila) {
        for (int columna = 0; columna < num_columnas; ++columna) {
            int valor;
            std::cout << "Ingrese el valor para la posicion (" << fila << ", " << columna << "): ";
            std::cin >> valor;

            if (valor == 1) {
                unos.push_back(fila * num_columnas + columna);
            }
            else if (valor == 0) {
                ceros.push_back(fila * num_columnas + columna);
            }
            else {
                std::cout << "Valor invalido. Ingrese 1 para uno o 0 para cero." << std::endl;
                --columna;
            }
        }
    }

    std::string simplifiedExpression = expresionSimplificada(numVariables, unos, ceros);
    std::cout << "\nExpresion simplificada: " << simplifiedExpression << std::endl;

    return 0;
}
