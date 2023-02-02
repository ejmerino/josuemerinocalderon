/*
Escriba un programa que lea tres valores enteros que represente el mes, el día y el año 
con cuatro dígitos. El programa deberá mostrar la fecha en uno de los formatos siguientes,
dependiendo de la selección del usuario. Si el usuario introduce 1, se mostrara el mes con
palabra (“Enero”), el día como un entero (11) y el año (1999). Si se introduce un 2, 
se mostrara el mes con una abreviatura de tres letras (“Ene”), el día como un entero (11)
y el año (1999). Si se produce un 3, se mostrara el mes como un entero (01), 
el día como un entero (11) y el año (1999).
*/

#include <iostream>

using namespace std;

int main() {
	int dia, mes, anio;
	string diaT,mesT, anioT;
	int opcion;

	cout << "Por favor introduzca el mes: ";
	cin >> mes;
	cout << "Por favor introduzca el dia: ";
	cin >> dia;
	cout << "Por favor introduzca el anio: ";
	cin >> anio;
	
	cout << "´Como le gustaria mostrar la fecha?" << endl;
	cout << endl;
	cout << "1.- Mes Completo, dia, anio" << endl;
	cout << "2.- Mes abreviado, dia, anio" << endl;
	cout << "3.- Mes, dia, anio en cifras" << endl;
	cout << endl;
	cout << "Opcion: ";
	cin >> opcion;

	switch (opcion) {
	case 1:
		if (mes == 1) {
			mesT = "Enero";
			if (dia>31) {
				cout << mesT <<" no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout<< "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 2) {
			mesT = "Febrero";
			if(dia>28){
				if (dia==29 and anio % 4 == 0 and anio % 100 != 0 or anio % 400 == 0) {
					cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
					cout << endl;
					cout << "Es anio biciesto!";
					cout << endl;
				}
				else {
					cout << "Febrero del anio " << anio << " no tiene " << dia << " dias, probablemente no es biciesto o ingreso un numero mayor a 28";
					cout << endl;
					system("pause");
				} 
			} else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes==3) {
			mesT = "Marzo";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 4) {
			mesT = "Abril";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 5) {
			mesT = "Mayo";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 6) {
			mesT = "Junio";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 7) {
			mesT = "Julio";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 8) {
			mesT = "Agosto";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 9) {
			mesT = "Septiembre";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 10) {
			mesT = "Octubre";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 11) {
			mesT = "Noviembre";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 12) {
			mesT = "Diciembre";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else {
			cout << "Ingrese un mes valido!!! ERROR" << endl;
			system("pause");
		}		
	break;

	case 2:
		if (mes == 1) {
			mesT = "Ene";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 2) {
			mesT = "Feb";
			if (dia > 28) {
				if (dia == 29 and anio % 4 == 0 and anio % 100 != 0 or anio % 400 == 0) {
					cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
					cout << endl;
					cout << "Es anio biciesto!";
					cout << endl;
				}
				else {
					cout << "Febrero del anio " << anio << " no tiene " << dia << " dias, probablemente no es biciesto o ingreso un numero mayor a 28";
					cout << endl;
					system("pause");
				}
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 3) {
			mesT = "Mar";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 4) {
			mesT = "Abr";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 5) {
			mesT = "May";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 6) {
			mesT = "Jun";
			if (dia > 30) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 7) {
			mesT = "Jul";
			if (dia > 31) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 8) {
			mesT = "Ago";
			if (dia > 31) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 9) {
			mesT = "Sep";
			if (dia > 30) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 10) {
			mesT = "Oct";
			if (dia > 31) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 11) {
			mesT = "Nov";
			if (dia > 30) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 12) {
			mesT = "Dic";
			if (dia > 31) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else {
			cout << "Ingrese un mes valido!!! ERROR" << endl;
			system("pause");
		}
	break;

	case 3:
		if (mes == 1) {
			mesT = "1";
			if (dia > 31) {
				cout << endl;
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("Color 04");
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 2) {
			mesT = "2";
			if (dia > 28) {
				if (dia == 29 and anio % 4 == 0 and anio % 100 != 0 or anio % 400 == 0) {
					cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
					cout << endl;
					cout << "Es anio biciesto!";
					cout << endl;
				}
				else {
					cout << "Febrero del anio " << anio << " no tiene " << dia << " dias, probablemente no es biciesto o ingreso un numero mayor a 28";
					cout << endl;
					system("pause");
				}
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 3) {
			mesT = "3";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 4) {
			mesT = "4";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 5) {
			mesT = "5";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 6) {
			mesT = "6";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 7) {
			mesT = "7";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 8) {
			mesT = "8";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 9) {
			mesT = "9";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 10) {
			mesT = "10";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 11) {
			mesT = "11";
			if (dia > 30) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else if (mes == 12) {
			mesT = "12";
			if (dia > 31) {
				cout << mesT << " no tiene " << dia << " dias";
				cout << endl;
				system("pause");
			}
			else {
				cout << "Fecha Traducida: " << "( " << mesT << " / " << dia << " / " << anio << " )" << endl;
			}
		}
		else {
			cout << "Ingrese un mes valido!!! ERROR" << endl;
			system("pause");
		}
		break;
	default:
		cout << "Digite una opcion correcta!";
		cout << endl;
	break;
	}

	return 0;
}