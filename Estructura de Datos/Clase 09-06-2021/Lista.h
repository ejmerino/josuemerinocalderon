/* Universidad de las Fuerzas Armadas - ESPE
   Software
   Autores:
   -Merino Josu�
   Enunciado del Problema: Listas 
   Fecha de creaci�n: 09/06/2021
   Fecha de modificaci�n: 09/06/2021
*/

#include "Nodo.h"
#include <iostream>

using namespace std;
class Lista
{
	private:
		Nodo *primero;
		Nodo *actual;
	bool listaVacia()
	{
		return(this->primero==NULL);
	}	
	public:
		Lista()
		{
			this->primero=NULL;
			this->actual=NULL;
		}
	void insertar(int val)
	{
		Nodo *nuevo=new Nodo(val);
		if(listaVacia())
		{
			this->primero=nuevo;
		}
		else
		{
			this->actual->siguiente=nuevo;
		}
		this->actual=nuevo;	
	}
	void mostrar()
	{
		Nodo *tmp=this->primero;
		while(tmp)
		{
			std::cout<<tmp->valor<<" "<<"->"<<" ";
			tmp=tmp->siguiente;
		}
		std::cout<<"NULL\n";
	}

};
