import string
import random
import big_o

def generador_de_cadenas():
    """
    Función para generar cadenas de caracteres
    ------------------------------------------
    Parámetros:
    longitud= Número de caracteres que se desea en la cadena
    ------------------------------------------
    Retorno:
    Se retorna una cadena de caracteres con la longitud que desea el usuario
    """
    #Validación de datos
    while True:
        #Sentencia try/except para validación de datos enteros
        try:
            #Se ingresa un valor entero
            longitud = int(input("Ingrese cuántos carácteres desea: "))
            break
        #Si el usuario no ingresa un valor que no sea entero
        except ValueError:
            #Se le notifica al usuario que ingrese un valor válido
            print("Ingrese un valor válido!")
    #si el valor ingresado es mayor a 0
    if longitud > 0:
        #Se genera la cadena de acuerdo a la longitud del usuario
        print(''.join(random.choice(string.ascii_letters + string.digits) for _ in range(longitud)))  
    #Si el valor ingresado es menor a 0      
    else: 
        #Se le notifica al usuario que se equivocó
        print("Ingrese un número mayor a 0!")
        #Se empieza de nuevo
        generador_de_cadenas()

if __name__=="__main__":
    """
    Función main que ejecuta el programa
    ------------------------------------
    No hay parámetros
    ------------------------------------
    No retorna nada
    """
    #Se llama a la función 
    generador_de_cadenas()