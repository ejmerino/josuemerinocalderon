#pragma once
class Vector 
{
	private:
		int* arreglo;

	public:
		//Vector=default;
		Vector();
		Vector(int*);
		int* getArreglo();
		void setArreglo(int*);
};