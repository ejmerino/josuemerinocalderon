"""
Dada una cadena, extraiga todas las subcadenas únicas con su frecuencia.

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""
import big_o

def subcadena_por_frecuencia(cadena):
    """
    Función que extrae todas las subcadenas únicas  de una cadena con su frecuencia
    -----------------------------------------------------------
    Argumentos:
        cadena (_string_): Recibe una cadena tipo string a ser evaluada
    ----------------------------------------------------------
    Retorna:
        subcadena (_string_): Subcadenas con su frecuencia
    """
    # Creo un diccionario para contabilizar las subcadenas con su freciencia
    diccionario = [cadena[idx: aux_1] for idx in range(len(cadena)) for aux_1 in range(idx + 1, len(cadena) + 1)]
    # Inicializo una variable donde se almaceneran las subcadenas
    subcadena = {}
    #Bucle para encontrar las subcadenas en el diccionario
    for idx in diccionario:
        #Si la combinación no se repite
        if idx not in subcadena.keys():
            #La subcadena es uno
            subcadena[idx] = 1
        #Si la combinación se repite
        else:
            #La subcadena se aumenta en uno
            subcadena[idx] += 1 
    #Notificación al usuario de las subcadenas que se obtiene
    print("Las subcadenas para la cadena: '"+ str(cadena) + "' son las siguientes" + str(subcadena))
    
if __name__ == "__main__":
    """
    Función que corre el aplicativo
    """
    #Se le pide al usuario su nombre
    nombre = str(input("Ingrese su nombre:"))
    #Saludo
    print("Bienvenido", nombre)
    #Se le pide al usuario una cadena
    cadena = str(input("Ingrese una cadena: "))
    #Se llama a la función y se le manda la cadena que será ingresada
    subcadena_por_frecuencia(cadena)
    aux_big_o = lambda n: cadena
    best, others= big_o.big_o(subcadena_por_frecuencia,aux_big_o)
    print("------------------------------------")
    print("Big O:", best)
    print("------------------------------------")