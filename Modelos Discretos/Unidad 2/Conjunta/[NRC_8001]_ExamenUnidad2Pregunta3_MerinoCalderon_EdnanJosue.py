"""
Escribe una función en Python que compare dos listas y nos diga si estas dos listas tienen un valor
común o no. En caso de tener un/unos valores comunes, usted debe imprimir el/los valor/es en común 
y la frecuencia de la misma.

Autor: Josué Merino
"""

def buscar_repetidos_en_lista(lista_a,lista_b):
    """Función que comprueba los elementos repetidos de dos listas

    Args:
        lista_a (string): Lista 1 ingresada por el usuario
        lista_b (string): Lista 2 ingresada por el usuario

    Retorna:
        Retorna los elementos repetidos
    """
    #Lista para almacenar los repetidos
    lista_repetidos=[]
    #Recorro los datos de la lista ingresada 1
    for i in lista_a:
        #Recorro los datos de la lista ingresada 2
        for j in lista_b:#recorremos uno a uno la segunda lista
            #Si existe un elemento igual
            if i==j:
                lista_repetidos.append(i)
    print("Se repiten : ",lista_repetidos)

if __name__ == "__main__":
    """
    Función que corre el aplicativo
    """
    lista_1 = ['']
    #El usuario ingresa la lista 1
    lista_1 = str(input("Ingrese una lista 1:"))
    lista_2 = ['']
    #El usuario ingresa la lista 2
    lista_2 = str(input("Ingrese una lista 2:"))
    #Se llama a la función
    buscar_repetidos_en_lista(lista_1,lista_2)
    