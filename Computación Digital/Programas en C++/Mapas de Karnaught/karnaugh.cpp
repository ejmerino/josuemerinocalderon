/*
Universidad de las Fuerzas Armadas - ESPE
Nombres: Jhoel Chicaiza, Josué Merino
Fecha: 08 de junio del 2023
Tema: Proyecto Final
Parcial: 1
*/

#include "karnaugh.h"
#include <iostream>
#include <cmath>

unsigned int codigoGray(unsigned int num) {
    return num ^ (num >> 1);
}

std::string expresionSimplificada(int num_variables, const std::vector<int>& unos, const std::vector<int>& ceros) {
    std::vector<std::vector<char>> mapaDeKarnaugh;

    // Calcular el tamaño del mapa de Karnaugh
    int num_filas = std::pow(2, num_variables - num_variables / 2);
    int num_columnas = std::pow(2, num_variables / 2);

    // Inicializar el mapa de Karnaugh con ceros
    for (int i = 0; i < num_filas; ++i) {
        mapaDeKarnaugh.push_back(std::vector<char>(num_columnas, '0'));
    }

    // Marcar las celdas correspondientes a los unos en el mapa de Karnaugh
    for (int uno : unos) {
        int fila = codigoGray(uno / num_columnas);
        int columna = codigoGray(uno % num_columnas);
        mapaDeKarnaugh[fila][columna] = '1';
    }

    // Marcar las celdas correspondientes a los ceros en el mapa de Karnaugh
    for (int cero : ceros) {
        int fila = codigoGray(cero / num_columnas);
        int columna = codigoGray(cero % num_columnas);
        mapaDeKarnaugh[fila][columna] = '0';
    }

    // Verificar si todos los datos de la tabla son 0
    bool todosCeros = true;
    for (const auto& fila : mapaDeKarnaugh) {
        for (char celda : fila) {
            if (celda == '1') {
                todosCeros = false;
                break;
            }
        }
        if (!todosCeros) {
            break;
        }
    }

    // Si todos los datos son 0, establecer la expresión simplificada como "0"
    if (todosCeros) {
        return "0";
    }

    // Construir la expresión simplificada
    std::string expresionSimplificada;

    for (int fila = 0; fila < num_filas; ++fila) {
        for (int columna = 0; columna < num_columnas; ++columna) {
            if (mapaDeKarnaugh[fila][columna] == '1') {
                std::string termino;

                // Agregar las variables correspondientes a los unos
                for (int variable = 0; variable < num_variables; ++variable) {
                    if (variable < num_variables / 2) {
                        if ((fila >> (num_variables / 2 - 1 - variable)) & 1) {
                            termino += static_cast<char>('A' + variable);
                        }
                        else {
                            termino += static_cast<char>('A' + variable);
                            termino += "'";
                        }
                    }
                    else {
                        if ((columna >> (num_variables - 1 - variable)) & 1) {
                            termino += static_cast<char>('A' + variable);
                        }
                        else {
                            termino += static_cast<char>('A' + variable);
                            termino += "'";
                        }
                    }
                }

                // Agregar el término a la expresión simplificada
                expresionSimplificada += termino + "+";
            }
        }
    }

    // Eliminar el último símbolo '+' si existe
    if (!expresionSimplificada.empty()) {
        expresionSimplificada.pop_back();
    }

    std::cout << "\nMapa de Karnaugh:" << std::endl;

    for (int row = 0; row < num_filas; ++row) {
        for (int col = 0; col < num_columnas; ++col) {
            std::cout << mapaDeKarnaugh[row][col] << ' ';
        }
        std::cout << std::endl;
    }

    return expresionSimplificada;
}
