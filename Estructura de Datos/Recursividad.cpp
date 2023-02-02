#include <iostream>
using namespace std;
int factorial(int);
int factorial(int n)
{
	if(n<1)
		return 1;
	else if(n>1)
		return n*factorial(n-1);
	return 1;
}

int main(int argc, char** argv) {
	
	cout<< factorial(5) <<endl;
	return 0;
}
