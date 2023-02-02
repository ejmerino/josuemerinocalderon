"""
En base a las instrucciones dadas por la docente usted debe generar un modelo matemático para programar la permutación en python. 
El programa debe ser genérico es decir el usuario puede ingresar cualquier número entero para hallar la permutación de dicho número.

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""
import numpy
import math

def perm_sin_orden():
    """
    Es una funcion para obtener el factorial de un número ingresado por el usuario
    Parametros:
    ------------
        n_1: número entero ingresado por el usuario
    
    Retorna:
    ------------
        n_1!: número factorial requerido por el usuario
    """
    #Valida que el número que se va a ingresar sea un número entero
    try:
        #Se le pide al usuario que ingrese un número entero
        n_1 = int(input("Ingrese un número entero: "))
        #La condición de que el número ingresado por el usuario sea mayor o igual a 0
        if(n_1 >= 0):
            #Se imprime el resultado del factorial n!
            print (n_1,"! es: ", math.factorial(n_1))
            #menu()        
        #Si es que no se cumple la condición de que el número ingresaro por el usuario sea mayor o igual a 0
        else:     
            #Se le comunica al usuario que debe ingresar un número entero
            print("Ingrese un número entero")
            #Se vuelve a llamar a la función ya que se ingresó un dato que no es el correcto
            perm_sin_orden()
    #Si el usuario no ingresó un número
    except:
        #Se le comunica al usuario que se equivocó y que debe ingresar un número entero
        print("Ingrese un número!")
        
def perm_orden():
    """
    Es una funcion para obtener la permutación de un conjunto de números ingresados por el usuario
    Parametros:
    ------------
        n: número entero ingresado por el usuario
        r: número entero ingresado por el usuario

    Retorna:
    ------------
        Permutación de la forma (n)!/(n-r)!
    """
    #Se le pide al usuario que ingrese un valor n de tipo entero
    n = int(input("Ingrese un número entero (n): "))
    #Se le pide al usuario que ingrese un valor r de tipo entero
    r = int(input("Ingrese un número entero (r): "))   
    #Si es que el número n es mayor a r existe resultado
    if(n>r):
        #Se imprime el resultado del cálculo de la permutación
        print ("La permutación de la forma (",n,")!/(",n,"-",r,")! es: ", math.factorial(n) / math.factorial(n - r))
    #Si es que el número n es menor a r no existe resultado
    else:
        #Se le informa al usuario que no existe permutación
        print("Su valor de r: ",r, "es mayor que su valor de n: ",n,"Por lo tanto no existe permutación")
        #Se llama de nuevo a la función
        perm_orden()
    #Se vuelve a llamar al menú principal
    menu()          
           
def menu():
    """
    Llama a la función menú para elegir un conjunto de opciones
    ------------
    El parámetro es la opción a elegir
    
    Retorna:
    ------------
    Retorna la opción elegida
    """
    opcion = ""
    #mientras la opcion sea diferente de 3
    while opcion != "3":
        #menu se ejcutara
        menu = """
        PERMUTACION POR JOSUÉ MERINO
        ------------------------
        1. Factorial n!
        2. Permutación de la forma (n)!/(n-r)!
        3. Salir
        ------------------------
        Elija su opción: """
        #opcion es igual a la entrada que debemos a menu
        opcion = input(menu)
        #si la opcion es 1
        if opcion == "1":
            #llamammos a la funcion permutar sin órden o factorial
            perm_sin_orden()
            break
        if opcion == "2":
            #Llamamos a la función permutar con órden
            perm_orden()
            break
menu()