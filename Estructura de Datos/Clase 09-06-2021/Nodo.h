/* Universidad de las Fuerzas Armadas - ESPE
   Software
   Autores:
   -Merino Josu�
   Enunciado del Problema: Listas 
   Fecha de creaci�n: 09/06/2021
   Fecha de modificaci�n: 09/06/2021
*/

class Nodo
{
	private:
		int valor;
		Nodo *siguiente;
	public:
		Nodo(int val, Nodo *sig=NULL)
		{
			this->valor=val;
			this->siguiente=sig;
		}
	friend class Lista;
};
