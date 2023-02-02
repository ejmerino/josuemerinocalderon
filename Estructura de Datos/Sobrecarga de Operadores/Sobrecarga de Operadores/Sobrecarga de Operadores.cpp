#include <iostream>
#include "Complejo.h"

using namespace std;

int main()
{
    Complejo<int> A(1, 3), B(2, 4);
    Complejo<int> C;

    int x, y;
    cout << "Suma de complejos" << endl;
    C = A + B;
    cout << C.getReal() << " + " << C.getImg() << " i" << endl;
    C.setImg(0); C.setReal(0);
    cout << "Resta de complejos" << endl;
    C = A - B;
    cout << C.getReal() << " + " << C.getImg() << " i" << endl;

    cin.ignore();

    return 0;
}
