/***********************************************************************
 * Module:  Datos.cpp
 * Author:  JOSUE
 * Modified: Wednesday, May 26, 2021 5:08:25 PM
 * Purpose: Implementation of the class Datos
 ***********************************************************************/

#include "Datos.h"



float Datos::getDato(void)
{
   return dato;
}

void Datos::setDato(float newDato)
{
   dato = newDato;
}


int Datos::getValor(void)
{
   return valor;
}

void Datos::setValor(int newValor)
{
   valor = newValor;
}


Datos::Datos(int valorNuevo, float datoNuevo)
{
   this->dato=datoNuevo;
   this->valor=valorNuevo;
   }

Datos::~Datos()
{
   delete();
}
