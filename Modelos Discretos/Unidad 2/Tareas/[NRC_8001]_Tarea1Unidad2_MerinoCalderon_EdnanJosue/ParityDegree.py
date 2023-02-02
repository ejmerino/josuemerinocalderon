"""
A positive integer N is given. The goal is to find the highest power of 2 that divides N. In other words, 
we have to find the maximum K for which N modulo 2^K is 0.

Autor: Josué Merino Calderón

Versión: 1.0
"""

import big_o

def ParityDegree(n):
    """
    Función para calcular la mayor potencia de dos que divide a un número dado
    --------------------------------------------------------------------------
    Args:
        n (_int_): número dado
    --------------------------------------------------------------------------
    Returns:
        _int_: Mayor potencia de dos que divide a un número dado
    """
    return (n & (~(n - 1)))	    
    
if __name__=='__main__':
    """
    Función main que corre el aplicativo
    ------------------------------------
    Args:
        numero (_int_): número ingresado por el usuario
    ------------------------------------
    """
    #Bucle para validación de datos
    while True:
        #Validación de datos
        try:
            #El usuario ingresa un número entero
            numero = int(input("Ingrese un número:"))
            #break
            break
        #Si el usuario ingresa un dato erróneo
        except ValueError:
            #Se le comunica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Si es que el usuario ingresó un número mayor a 
    if numero > 0:
        #Se almacena el número en una variable n
        N = numero
        #La mayor potencia de 2 que divide al número y se ejecuta el algoritmo
        print("La mayor potencia de 2, que divide a",numero,"es:",ParityDegree(N)) 
        #Se almacena la variable N en numero_entero     
        numero_entero = lambda n: N
        #Se mide la complejidad del algoritmo Parity Degree
        best, others= big_o.big_o(ParityDegree,numero_entero)
        print("------------------------")
        #Se imprime la complejidad Big O
        print("Big O =",best)
        print("------------------------")
    #Si es que el usuario ingresó un número menor o igual a 0
    else:
        #Le notifica al usuario que ingresó un dato erróneo
        print("Ingrese un número mayor que 0!")   
    