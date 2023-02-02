"""
Escriba un programa de Python para obtener una cadena de una cadena dada donde todas
las apariciones de su primer carácter se hayan cambiado a '*', excepto el primer carácter en sí.

Autor: Ednan Josué Merino Calderón
"""
def change_char(cadena):
    """
    Función para cambiar 

    Args:
        cadena (str): cadena ingresada

    Returns:
        cadena: cadena nueva
    """
    #Cadena de tipo char
    char = cadena[0]
    #A la cadena se cambia las repetidas por "*"
    cadena = cadena.replace(char, '*')
    cadena = char + cadena[1:]
    #Retorna la cadena
    return cadena

def ingreso():
    """
    Función que pide al usuario que ingresa por teclado
    """
    #Se le pide al usuario una cadena
    palabra= str(input("Ingrese una palabra"))
    #se imprime
    print(change_char(palabra))

if __name__ == "__main__":
    ingreso()