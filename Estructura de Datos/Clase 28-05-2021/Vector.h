#pragma once
#include <iostream>

class Vector{
	private:
		int vect[10];
	public:
		Vector(int [10]);
		Vector()=default;
		void set_vect(int[10]);
		int *get_vect();
		~Vector();
};



