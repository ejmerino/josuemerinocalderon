#include "Operations.h"
#include <stdlib.h>

Operaciones::Operaciones(Datos datitos){
	datos = datitos;			
}

float Operations::operator+(Datos datitos2){
	return this->datitos2.getDato()+float(datitos2.getValor());
}

float Operations::operator+(Datos datitos2){
	return this->datitos2.getDato()-float(datitos2.getValor());
}

