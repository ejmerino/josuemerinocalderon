/*
Universidad de las Fuerzas Armadas - ESPE
Nombres: Jhoel Chicaiza, Josué Merino
Fecha: 08 de junio del 2023
Tema: Proyecto Final
Parcial: 1
*/

#pragma once
#ifndef KARNAUGH_H
#define KARNAUGH_H

#include <vector>
#include <string>

unsigned int codigoGray(unsigned int num);
std::string expresionSimplificada(int num_variables, const std::vector<int>& unos, const std::vector<int>& ceros);

#endif  // KARNAUGH_H

