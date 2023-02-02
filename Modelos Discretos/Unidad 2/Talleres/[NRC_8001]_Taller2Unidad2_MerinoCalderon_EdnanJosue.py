"""
El programa debe ser genérico es decir el usuario puede ingresar cualquier número entero para hallar
su combinación. Por ejemplo: si el usuario ingresa el número 3 usted deberá resolver la combinación
de una lista de 3 elementos ([1,2,3]).

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""

import numpy
import os
import math

os.system("cls")

def combinacion(iterable, r):
    '''Es una funcion para obtener la combinación de un conjunto de números/letras ingresados por el usuario
    Parametros:
    ------------
        iterable: número o palabra que ingresara el usuario
        r: Órden de las combinaciones ingresado por el usuario

    Retorna:
    ------------
        Combinación
    '''    
    #tuple para almacenar datos en una misma variable
    char = tuple(iterable)
    #len regresa el número de items que se encuentran contenidos.
    n = len(char)     
    #Si es que un r es mayor que n 
    if r > n:
        #Si es que r es mayor que n, retorna
        return
    #numpy.arange genera un array de números, index nos permite obtener el índice o posición de la 
    #primera aparición de un elemento dentro de una lista
    index = numpy.arange(r)
    #retorna un generador de objetos en este caso la combinación      
    yield tuple(char[i] for i in index)
    #Bucle while true 
    while True:
        #Para un i reversa un objeto de secuencia y lo devuelve en forma de lista dentro del rango r
        for i in reversed(range(r)):
            #Si la posición de i no es igual a i+n-r
            if index[i] != i + n - r:
                break
        #Si no se cumple la condición
        else:
            #Si no se cumple la condición retorna:
            return          
        #la posición aumentada en uno
        index[i] += 1

        #para j dentro del rango i+1, hasta r 
        for j in range(i + 1, r):
            #Para donde se encuentre la posición j              
            index[j] = index[j-1] + 1 
        #retorna un generador de objetos en este caso la combinación             
        yield tuple(char[i] for i in index)  

#Es el main de la aplicación.
if __name__=="__main__":
    #Imprime los datos del autor
    print ("Combinación por Ednan Josué Merino Calderón")
    #El usuario ingresa por teclado la palabra o número para combinar
    palabra_numero = str(input("Ingrese una palabra o número: "))
    #El usuario ingresa por teclado el órden de las combinaciones que desea
    n = int(input("De qué órden desea las combinaciones: ")) 
    #Cuenta los caracteres de la palabra para poder encontrar el número de combinaciones        
    caracteres = len(palabra_numero)
    #Imprime cuantas combinaciones hay
    print ("Existen: ",math.factorial(caracteres)//(math.factorial(caracteres - n)*math.factorial(n)), "combinaciones")
    #Se imprime la solución utilizando la función combinación con los atributos palabra_numero y n
    print([x for x in combinacion(palabra_numero, n)])