"""
Write a function that, given a string s, returns the index (counting from 0) of a character such that the part of 
the string to the left of that character is a reversal of the part of the string to its right. The function should
return −1 if no such index exists.

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""
import big_o

def ingreso_de_cadena():
    """
    Función que sirve para que el usuario ingrese una cadena
    ---------------------------------------
    Parámetros:
    cadena = cadena ingresada por el usuario
    ---------------------------------------
    Retorno:
    Retorna la cadena
    """
    #se le solicita al usuario ingresar una cadena
    cadena=str(input("Digite una cadena:"))
    #Devuelve la cadena
    return cadena

def detectar(cadena):
    """
    Funcion que evalua la cadena y recorre todos sus caracteres
    -------------------------------------
    Parámetros: cadena (_str_): cadena de caracteres que el usuario ingresó con anterioridad
    -------------------------------------
    Retorna:-1
    """
    #si la longitud de la cadena es 0
    if len(cadena) == 0:
        #retorna -1
        return -1
    #Para la variable i que esté dentro del rango
    for i in range(len(cadena)):
        #Devuelve una cadena índice 0 hasta el índice i-1
        if cadena[:i] == cadena[i+1:][::-1] or cadena[i:] == cadena[:i][::-1]:
            #retorna i
            return i
    #retorna -1
    return -1

if __name__ == '__main__':
    """
    Función que ejecuta el aplicativo
    ---------------------------------
    No hay parámetros
    ---------------------------------
    No Retorna nada
    """
    #Llama a la función ingreso de cadena
    N=ingreso_de_cadena()
    #imprimo lo que retorna la función
    print("Retorna:",detectar(N))
    #almaceno en una nueva variable para detectar tiempo de ejecución
    cadena_str = lambda n: N
    #Se mide la complejidad del algoritmo Parity Degree
    best, others= big_o.big_o(detectar,cadena_str)
    print("------------------------")
    #se imprime la complejidad Big O
    print("Big O =",best)
    print("------------------------")    