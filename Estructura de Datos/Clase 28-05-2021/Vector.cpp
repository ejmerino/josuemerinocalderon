#include "Vector.h"

Vector::Vector(int vec[10]){	
for(int i=0;i<10;i++){
	vect[i]=vec[i];
	}
}

void Vector::set_vect(int vec[10]){
	for(int i=0; i<10;i++){
	vect[i]=vec[i];
	}
}

int *Vector::get_vect(){
	return vect;
}

