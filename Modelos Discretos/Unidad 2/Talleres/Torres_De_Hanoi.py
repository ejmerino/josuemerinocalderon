"""
Torres De Hanoi

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""

def torres_de_hanoi(n , A, B, C):
    """
    Función para solucionar el juego Las Torres de Hanoi
    ---------------------------------------------------------------------------
    Parámetro:
    n= número de discos.
    A= Torre de la izquierda
    B= Torre del medio
    C= Torre de la derecha
    ---------------------------------------------------------------------------
    Retorna:
    Mediante la Recursividad Soluciona el problema
    """
    #Se mueve el disco inicial
    if n==1:
        #Se imprime que el disco 1 se ha movido de torre
        print("Disco 1 de",A,"a",B)
        #Retorna
        return 
    #El disco que quedó libre se cambia a la torre libre
    torres_de_hanoi(n-1, A, C, B)
    #Se imprime que el disco ha sido movido
    print("Disco",n,"de",A,"a",B)
    #El disco de menor tamaño se coloca sobre el de mayor tamaño
    torres_de_hanoi(n-1, C, B, A)

def entrada_a_hanoi():
    """
    Función para la entrada de número de discos que requiere el usuario, con sus respectivas validaciones
    -----------------------------------------------------------------------------------------------------
    Parámetro:
    numero= Número de discos que utilizará el usuario
    -----------------------------------------------------------------------------------------------------
    No retorna nada
    """
    
    #Validación de datos mediante un bucle While
    while True:
        #Sentencia try/except
        try:
            #El usuario ingresa el número de discos
            numero=int(input("Ingrese el número de discos:"))
            #break
            break
        #Si el usuario ingresa un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un número!\n")  
    if numero>0:
        torres_de_hanoi(numero,'Torre Izquierda','Torre del Medio','Torre Derecha')
    else:
        #Se le notifica al usuario que se equivocó
        print("Ingrese un valor mayor a 0")
        #Se alienta al usuario a repetir el proceso
        print("Inténtelo de nuevo!\n")   
        #Se repite el proceso
        entrada_a_hanoi()

#Es el main del aplicativo
if __name__=="__main__":
    """
    Función main que se encarga de correr el aplicativo
    ---------------------------------------------------
    No hay parámetros
    ---------------------------------------------------
    Retorna la función entrada_a_hanoi()
    """
    #Título del ejercicio
    print("Torres de Hanoi por Josué Merino\n")
    #Llama a la función menú.
    entrada_a_hanoi()