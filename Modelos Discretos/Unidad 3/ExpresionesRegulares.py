"""
    Expresiones regulares en Python

    Autor: Ednan Josué Merino Calderón

    Versión: 1.0

    Fecha: 24 de febrero del 2023
"""

import re
import os
import sys

def buscar_patron():
    """
    Esta función busca un patrón en una cadena y devuelve el número de coincidencias encontradas

    --------------------------------------------
    Argumentos:
    No recibe argumentos.

    --------------------------------------------
    Retorna:
    No retorna ningún valor, pero imprime en pantalla el número de coincidencias encontradas y da la opción de volver al menú principal.
    """
    # Se pide al usuario ingresar una cadena y un patrón a buscar
    cadena = input("Ingrese una cadena: ")
    patron = input("Ingrese un patrón a buscar: ")

    # Se utiliza la función findall() de la librería re para encontrar todas las coincidencias del patrón en la cadena
    coincidencias = re.findall(patron, cadena, re.IGNORECASE)

    # Se imprime el número de coincidencias encontradas
    if len(coincidencias) == 1:
        print("Se encontró 1 coincidencia")
    elif coincidencias:
        print("Se encontraron", len(coincidencias), "coincidencias")
    else:
        print("No se encontraron coincidencias")

    # Se le pregunta al usuario si desea volver al menú principal
    opcion_1 = str(input("\nDesea volver al menú principal (s/n):"))
    if opcion_1 == 's':
        os.system("cls")
        menu_principal_1()
    # Si no el programa termina la ejecución
    else:
        sys.exit()

def reemplazar_patron():    
    """
    Esta función reemplaza un patrón por otro en una cadena.
    --------------------------------------------
    Argumentos:
    No recibe argumentos.
    --------------------------------------------
    Retorna:
    No retorna ningún valor, pero imprime en pantalla la cadena original y la cadena modificada y da la opción de volver al menú principal.
    """
    # Se pide al usuario ingresar una cadena, un patrón a reemplazar y un nuevo valor para el patrón
    cadena = input("Ingrese una cadena: ")
    patron = input("Ingrese un patrón a reemplazar: ")
    nuevo_valor = input("Ingrese un nuevo valor para el patrón: ")

    # Se utiliza la función sub() de la librería re para reemplazar todas las ocurrencias del patrón en la cadena con el nuevo valor
    nueva_cadena = re.sub(patron, nuevo_valor, cadena)

    print("\nNueva cadena:", nueva_cadena)

    # Se le pregunta al usuario si desea volver al menú principal
    opcion_1 = str(input("\nDesea volver al menú principal (s/n):"))
    if opcion_1 == 's':
        os.system("cls")
        menu_principal_1()
    else:
        # Si no el programa termina la ejecución
        sys.exit()
    

def dividir_cadena():
    """
    Esta función divide una cadena utilizando un patrón dado.
    --------------------------------------------
    Argumentos:
    No recibe argumentos.

    --------------------------------------------
    Retorna:
    No retorna ningún valor, pero imprime en pantalla las partes en que se divide la cadena y da la opción de volver al menú principal.
    """
    # Se pide al usuario ingresar una cadena y un patrón para dividir la cadena
    cadena = input("Ingrese una cadena: ")
    patron = input("Ingrese un patrón para dividir la cadena: ")

    # Se utiliza la función split() de la librería re para dividir la cadena utilizando el patrón especificado
    partes = re.split(patron, cadena)

    # Se imprimen las partes de la cadena resultantes
    print("Partes:", partes)

    # Se le pregunta al usuario si desea volver al menú principal
    opcion_1 = str(input("\nDesea volver al menú principal (s/n):"))
    if opcion_1 == 's':
        os.system("cls")
        menu_principal_1()
    else:
        # Si no el programa termina la ejecución
        sys.exit()



def menu_principal_1():
    """
    Esta función es el menú principal del programa, desde donde se pueden seleccionar las diferentes opciones.
    --------------------------------------------
    Argumentos:
    No recibe argumentos.

    --------------------------------------------
    Retorna:
    No retorna ningún valor, pero llama a las funciones correspondientes según la opción seleccionada por el usuario.
    """
    # Se muestra el menú principal y se le pide al usuario que ingrese una opción
    while True:
        print("\nExpresiones Regulares por Josué Merino")
        print("\n1. Buscar un patrón en una cadena")
        print("2. Reemplazar un patrón en una cadena")
        print("3. Dividir una cadena utilizando un patrón")
        print("4. Salir")
        print("\nSeleccione una opción:")
        # El usuario ingresa la opción
        opcion = input()
        # Si ingresó el 1
        if opcion == "1":
            os.system("cls")
            print("Buscar un patrón en una cadena")
            buscar_patron()
        # Si ingresó el 2
        elif opcion == "2":
            os.system("cls")
            print("Reemplazar un patrón en una cadena")
            reemplazar_patron()
        # Si ingresó el 3
        elif opcion == "3":
            os.system("cls")
            print("Dividir una cadena utilizando un patrón")            
            dividir_cadena()
        # Si ingresó el 4
        elif opcion == "4":
            break
        else:
            print("Opción no válida")

if __name__ == '__main__':
    # Llama a la función menú principal
    menu_principal_1()
