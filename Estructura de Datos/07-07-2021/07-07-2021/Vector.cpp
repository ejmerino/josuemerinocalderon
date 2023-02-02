#include "Vector.h"

Vector::Vector() 
{

}

Vector::Vector(int* array_) 
{
	arreglo = array_;
}

void Vector::setArreglo(int* array_) 
{
	arreglo = array_;
}

int* Vector::getArreglo() 
{
	return arreglo;
}