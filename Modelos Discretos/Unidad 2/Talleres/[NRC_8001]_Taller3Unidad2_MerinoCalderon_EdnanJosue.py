"""
En base a las instrucciones dadas por la docente usted debe generar un modelo matemático para 
programar la suma de n número usando python. Recuerde que el programa debe ser genérico es decir 
puede sumar la cantidad de números que el usuario desee.

Autor: Ednan Josué Merino Calderón

Versión:1.0
"""

def suma_consecutiva():
    """
    Suma consecutivamente los números desde 1 hasta el que decida el usuario
    ------------   
    Retorna:
    ------------
    La suma de 1 hasta n
    """
    #Mientras sea verdadero
    while True:
        #Manejo de excepciones
        try:
            #Se le pide al usuario que ingrese un número entero para sumar
            n = int(input("Ingrese cuántos números desea sumar: "))
            #Sentencia que permite para un bucle
            break
        #Si se produce una excepción/error
        except ValueError:
            #Se le notifica al usuario que no ingreso correctamente lo solicitado
            print("El valor introducido no es un número. Intenta de nuevo")  
    #Se inicializa la variable m en 0
    m=0
    #Para un valor i, dentro del rango 1 y el número ingresado
    for i in range (1,n+1):
        #Se imprimen los números
        print(i)
        #La suma es la variable m
        m=m+i
    #Se imprime la solución
    print("La suma de los primeros",n,"números naturales es:",m)

def suma_n_numeros():
    """
    Se le pide al usuario que ingrese cierta cantidad de números para sumar
    ------------
    Retorna:
    ------------
    La suma de los números ingresados por teclado
    """
    #Mientras sea verdadero
    while True:
        #Manejo de excepciones
        try:
            #Se le pide al usuario que ingrese una cantidad de número para sumar
            n=int(input("Ingrese cuántos números va a sumar: "))
            #Sentencia que permite parar un bucle
            break
        #Si se produce una excepción o error
        except ValueError:
            #Se le notifica al usuario que su valor no es un número
            print("El valor introducido no es un número. Intenta de nuevo")    
    #Inicializamos la variable m con 0
    m=0
    #Bucle mientras n sea mayor que 0
    while n>0:
        #Mientras sea verdadero
        while True:
            #Manejo de excepciones
            try:
                #Se le pide al usuario que ingrese un número
                numero=int(input("Ingrese un Número: "))
                #Sentencia que permite parar un bucle
                break
            #Si se produce una excepción/error
            except ValueError:
                #Se le notifica al usuario que no ingresó un número correctamente
                print("El valor introducido no es un número. Intenta de nuevo") 
        #La variable m es igual a m+suma de dígitos
        m=m+numero
        #Se finaliza el ciclo
        n=n-1
    #Se imprime la suma
    print("La suma es:",m)

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
        SUMA GENÉRICA POR JOSUÉ MERINO
        ------------------------
        1. Suma Consecutiva
        2. Suma de n números
        3. Salir
        ------------------------
        Elija su opción: """
        #opcion es igual a la entrada que debemos a menu
        opcion = input(menu)
        #si la opcion es 1
        if opcion == "1":
            #llamammos a la funcion suma consecutiva
            suma_consecutiva() 
            break           
        if opcion == "2":
            #Llamamos a la función suma de n números
            suma_n_numeros()  
            break         
#Es el main del aplicativo
if __name__=="__main__":
    #Llama a la función menú.
    menu()