#include <iostream>
#include <string>
#include <cmath>
#include <cctype>

using namespace std;

// Funciones de conversión
string decimalABinario(int decimal) {
    string binario = "";

    if (decimal == 0) {
        return "0";
    }

    while (decimal > 0) {
        binario = to_string(decimal % 2) + binario;
        decimal /= 2;
    }

    return binario;
}

int binarioADecimal(string binario) {
    int decimal = 0, potencia = 0;

    for (int i = binario.length() - 1; i >= 0; i--) {
        if (binario[i] == '1') {
            decimal += pow(2, potencia);
        }

        potencia++;
    }

    return decimal;
}

int octalADecimal(string octal) {
    int decimal = 0, potencia = 0;

    for (int i = octal.length() - 1; i >= 0; i--) {
        decimal += (octal[i] - '0') * pow(8, potencia);
        potencia++;
    }

    return decimal;
}

string decimalAOctal(int decimal) {
    string octal = "";

    if (decimal == 0) {
        return "0";
    }

    while (decimal > 0) {
        octal = to_string(decimal % 8) + octal;
        decimal /= 8;
    }

    return octal;
}

int hexadecimalADecimal(string hexadecimal) {
    int decimal = 0, potencia = 0;

    for (int i = hexadecimal.length() - 1; i >= 0; i--) {
        if (isdigit(hexadecimal[i])) {
            decimal += (hexadecimal[i] - '0') * pow(16, potencia);
        } else {
            decimal += (toupper(hexadecimal[i]) - 'A' + 10) * pow(16, potencia);
        }

        potencia++;
    }

    return decimal;
}

string decimalAHexadecimal(int decimal) {
    string hexadecimal = "";

    if (decimal == 0) {
        return "0";
    }

    while (decimal > 0) {
        int resto = decimal % 16;

        if (resto < 10) {
            hexadecimal = to_string(resto) + hexadecimal;
        } else {
            hexadecimal = (char)(resto - 10 + 'A') + hexadecimal;
        }

        decimal /= 16;
    }

    return hexadecimal;
}

// Función para mostrar el menú
void mostrarMenu() {
    cout << "Elegir la conversion:" << endl;
    cout << "1. Decimal a binario" << endl;
    cout << "2. Binario a decimal" << endl;
    cout << "3. Octal a decimal" << endl;
    cout << "4. Decimal a octal" << endl;
    cout << "5. Hexadecimal a decimal" << endl;
    cout << "6. Decimal a hexadecimal" << endl;
    cout << "7. Salir" << endl;
    
}

int main() {
    bool salir = false;

    while (!salir) {
        mostrarMenu();

        // Pedir la opción al usuario
        int opcion;
        cout << "Ingrese la opción deseada: ";
        cin >> opcion;

        switch (opcion) {

            case 1: {
                // Decimal a binario
                int decimal;
                cout << "Ingrese el número decimal que desea convertir a binario: ";
                if (!(cin >> decimal)) {
                    cout << "Error: Ingrese un número válido" << endl;
                    cin.clear();
                    cin.ignore(numeric_limits<streamsize>::max(), '\n');
                    break;
                }
                string binario = decimalABinario(decimal);
                cout << "El número " << decimal << " en binario es: " << binario << endl;
                break;
            }
            case 2: {
                // Binario a decimal
                string binario;
                cout << "Ingrese el número binario que desea convertir a decimal: ";
                cin >> binario;
                bool esBinario = true;
                for (char c : binario) {
                    if (c != '0' && c != '1') {
                        esBinario = false;
                        break;
                    }
                }
                if (!esBinario) {
                    cout << "Error: Ingrese un número binario válido" << endl;
                    break;
                }
                int decimal = binarioADecimal(binario);
                cout << "El número " << binario << " en decimal es: " << decimal << endl;
                break;
            }
            case 3: {
                // Octal a decimal
                string octal;
                cout << "Ingrese el número octal que desea convertir a decimal: ";
                cin >> octal;
                bool esOctal = true;
                for (char c : octal) {
                    if (c < '0' || c > '7') {
                        esOctal = false;
                        break;
                    }
                }
                if (!esOctal) {
                    cout << "Error: Ingrese un número octal válido" << endl;
                    break;
                }
                int decimal = octalADecimal(octal);
                cout << "El número " << octal << " en decimal es: " << decimal << endl;
                break;
            }
            case 4: {
                // Decimal a octal
                int decimal;
                cout << "Ingrese el número decimal que desea convertir a octal: ";
                if (!(cin >> decimal)) {
                    cout << "Error: Ingrese un número válido" << endl;
                    cin.clear();
                    cin.ignore(numeric_limits<streamsize>::max(), '\n');
                    break;
                }
                string octal = decimalAOctal(decimal);
                cout << "El número " << decimal << " en octal es: " << octal << endl;
                break;
            }
            case 5: {
                // Hexadecimal a decimal
                string hexadecimal;
                cout << "Ingrese el número hexadecimal que desea convertir a decimal: ";
                cin >> hexadecimal;
                bool esHexadecimal = true;
                for (char c : hexadecimal) {
                    if (!isdigit(c) && (toupper(c) < 'A' || toupper(c) > 'F')) {
                        esHexadecimal = false;
                        break;
                    }
                }
                if (!esHexadecimal) {
                    cout << "Error: Ingrese un número hexadecimal válido" << endl;
                    break;
                }
                int decimal = hexadecimalADecimal(hexadecimal);
                cout << "El número " << hexadecimal << " en decimal es: " << decimal << endl;
                break;
            }
            case 6: {
                // Decimal a hexadecimal
                int decimal;
                cout << "Ingrese el número decimal que desea convertir a hexadecimal: ";
                if (!(cin >> decimal)) {
                                        cout << "Error: Ingrese un número válido" << endl;
                    cin.clear();
                    cin.ignore(numeric_limits<streamsize>::max(), '\n');
                    break;
                }
                string hexadecimal = decimalAHexadecimal(decimal);
                cout << "El número " << decimal << " en hexadecimal es: " << hexadecimal << endl;
                break;
            }
            case 7: {
                // Salir
                cout << "Saliendo del programa..." << endl;
                salir = true;
                break;
            }
            default: {
                cout << "Error: Ingrese una opción válida" << endl;
                break;
            }
        }
    }
    
    return 0;
}

