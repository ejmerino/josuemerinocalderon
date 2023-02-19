"""
Proyecto Final Unidad 3 - Materia: Modelos Discretos
Aplicación: Manhattan Fast

Autor: Ednan Josué Merino Calderón

Versión: 1.1
"""
#libreria que uso para obtener la tecla presionada sin necesidad de presionar Enter
import msvcrt
#libreria que uso para pausar y limpiar pantalla
import os
#Libreria para cambiar el color mientras se elige en el menú
from colorama import init, Fore, Style
#Librería para salir del aplicativo
import sys
#libreria para ejecutar música
import pygame

def reproducir_cancion(cancion):
    """Esta función reproduce una canción utilizando Pygame

    Argumento:
        cancion (str): La ruta del archivo de la canción que se desea reproducir
    """
    # Inicializar Pygame mixer para permitir la reproducción de audio
    pygame.mixer.init()
    # Cargar la canción en Pygame mixer utilizando el método "load"
    pygame.mixer.music.load(cancion)
    # Iniciar la reproducción de la canción en bucle indestinoito utilizando el método "play"
    pygame.mixer.music.play(loops=-1)

def getch():
    """
    Funcion que obtiene la tecla presionada sin necesidad de presionar Enter, permitiendo al usuario seleccionar 
    las opciones del menú utilizando las flechas del teclado y presionando Enter para confirmar la selección.
    Parametros:
        Esta funcion no tiene parametros
    Retorna:
        msvcrt.getch()
    """
    # Utilizar la función "getch()" de la librería "msvcrt" para obtener la tecla presionada por el usuario
    return msvcrt.getch()

def atracciones_new_york():
    """
    Función para seleccionar una atracción turística en Nueva York.
    -------------------------
    Parámetros:
        No tiene parámetros
    -------------------------
    Retorna:
        int: El índice de la opción seleccionada en la lista de atracciones.
    """
    # Inicializa el módulo colorama para poder imprimir en la consola con colores
    init()
    
    # Dedestinoe los colores para las opciones seleccionadas y no seleccionadas
    selected_color = Fore.BLUE + "-" + Fore.WHITE + Style.BRIGHT + "-" + Fore.RED
    not_selected_color = Fore.RESET + Style.RESET_ALL
    
    # Crea una lista con las atracciones de Nueva York
    atracciones = ["NYC Museum", "Strawberry Fields", "Central Park Zoo", "Plaza Hotel", "St Patrick Catedral",
                   "Rockefeller", "Summit One", "Times Square", "Madamme Tussauds", "Port Autorithy", "Empire State Building",
                   "Vessel", "The Edge", "Madison Square Garden", "Cryslier Building", "Flatiron Building", "Ice Cream Museum",
                   "Brookyn Bridge", "September11 Memorial", "Wallstreet Bull"]
    
    # Inicializa la variable 'choice' en 0, que corresponde a la opción seleccionada por el usuario
    choice = 0
    
    while True:
        os.system("cls")
        print("Selecciona la Atracción")
        
        # Imprime las opciones de atracciones en la consola, resaltando la opción seleccionada con colores
        for i, option in enumerate(atracciones):
            if i == choice:
                print(selected_color+"⮕ " + option+not_selected_color)
            else:
                print(not_selected_color+"  " + option)
        
        # Obtiene la tecla que el usuario presiona y actualiza la variable 'choice' según la opción seleccionada
        key = getch()
        #Para ir hacia arriba con las teclas w u 8
        if key == b"w" or key == b"8" and choice > 0:
            choice -= 1
        #Para ir hacia abajo con las teclas s o 5
        elif key == b"s" or key == b"5" and choice < len(atracciones) - 1:
            choice += 1
        elif key == b"\r":
            # Si el usuario presiona Enter, se retorna la opción seleccionada
            return choice


def nodos_unidos():
    """
    Función que une las atracciones de Manhattan como nodos y crea el grafo.
    -------------------------------------------------------------------------
    Argumentos:
        No tiene argumentos
    -------------------------------------------------------------------------      
    Retorna:
        El grafo de tipo lista
    """
    #Creo un diccionario vacío, inicializa una lista vacía llamada grafo con 20 elementos, donde cada elemento es una lista vacía. En otras palabras, se crea una lista que puede contener hasta 20 listas anidadas, cada una de las cuales representa un nodo o vértice en un grafo.
    grafo,costo = [[] for i in range(20)],{}
    # Se dedestinoen los índices de los nodos en la lista grafo
    #NYC Museum ocupa la posición 0, recordando que en Python se inicia desde la posición 0
    NYC_Museum = 0
    Strawberry_Fields = 1
    Central_Park_Zoo = 2
    Plaza_Hotel = 3
    St_Patrick_Catedral=4
    Rockefeller=5
    Summit_One=6
    Times_Square=7
    Madamme_Tussauds=8
    Port_Autorithy=9
    Empire_State_Building=10
    Vessel=11
    The_Edge=12
    Madison_Square_Garden=13
    Cryslier_Building=14
    Flatiron_Building=15
    Ice_Cream_Museum=16
    Brookyn_Bridge=17
    September11_Memorial=18
    Wallstreet_Bull=19
    #Armo el grafo uniéndo los nodos según corresponda
    grafo[NYC_Museum].append(Strawberry_Fields)
    grafo[Strawberry_Fields].append(NYC_Museum)
    grafo[Strawberry_Fields].append(Central_Park_Zoo)
    grafo[Central_Park_Zoo].append(Strawberry_Fields)    
    grafo[Central_Park_Zoo].append(Plaza_Hotel)
    grafo[Plaza_Hotel].append(St_Patrick_Catedral)
    grafo[Plaza_Hotel].append(Central_Park_Zoo)
    grafo[St_Patrick_Catedral].append(Plaza_Hotel)
    grafo[St_Patrick_Catedral].append(Summit_One)
    grafo[St_Patrick_Catedral].append(Rockefeller)
    grafo[Rockefeller].append(St_Patrick_Catedral)
    grafo[Rockefeller].append(Summit_One)
    grafo[Rockefeller].append(Times_Square)
    grafo[Summit_One].append(St_Patrick_Catedral)
    grafo[Summit_One].append(Rockefeller)
    grafo[Summit_One].append(Madamme_Tussauds)
    grafo[Summit_One].append(Empire_State_Building)
    grafo[Times_Square].append(Rockefeller)
    grafo[Times_Square].append(Madamme_Tussauds)
    grafo[Madamme_Tussauds].append(Times_Square)
    grafo[Madamme_Tussauds].append(Summit_One)
    grafo[Madamme_Tussauds].append(Empire_State_Building)
    grafo[Madamme_Tussauds].append(Port_Autorithy)
    grafo[Port_Autorithy].append(Madamme_Tussauds)
    grafo[Port_Autorithy].append(The_Edge)
    grafo[Port_Autorithy].append(Vessel)
    grafo[Vessel].append(Port_Autorithy)
    grafo[Vessel].append(The_Edge)
    grafo[The_Edge].append(Ice_Cream_Museum)
    grafo[The_Edge].append(Vessel)
    grafo[The_Edge].append(Madison_Square_Garden)
    grafo[The_Edge].append(Port_Autorithy)
    grafo[Empire_State_Building].append(Madamme_Tussauds)
    grafo[Empire_State_Building].append(Summit_One)
    grafo[Empire_State_Building].append(Cryslier_Building)
    grafo[Empire_State_Building].append(Madison_Square_Garden)
    grafo[Madison_Square_Garden].append(Empire_State_Building)
    grafo[Madison_Square_Garden].append(The_Edge)
    grafo[Madison_Square_Garden].append(Flatiron_Building)
    grafo[Cryslier_Building].append(Madison_Square_Garden)
    grafo[Cryslier_Building].append(Flatiron_Building)
    grafo[Cryslier_Building].append(Brookyn_Bridge)
    grafo[Flatiron_Building].append(Madison_Square_Garden)
    grafo[Flatiron_Building].append(Cryslier_Building)
    grafo[Flatiron_Building].append(Brookyn_Bridge)
    grafo[Flatiron_Building].append(Ice_Cream_Museum)
    grafo[Ice_Cream_Museum].append(The_Edge)
    grafo[Ice_Cream_Museum].append(September11_Memorial)
    grafo[Ice_Cream_Museum].append(Brookyn_Bridge)
    grafo[Ice_Cream_Museum].append(Flatiron_Building)
    grafo[Brookyn_Bridge].append(Flatiron_Building)
    grafo[Brookyn_Bridge].append(Cryslier_Building)
    grafo[Brookyn_Bridge].append(Ice_Cream_Museum)
    grafo[Brookyn_Bridge].append(Wallstreet_Bull)
    grafo[September11_Memorial].append(Ice_Cream_Museum)
    grafo[September11_Memorial].append(Wallstreet_Bull)
    grafo[Wallstreet_Bull].append(September11_Memorial)
    grafo[Wallstreet_Bull].append(Brookyn_Bridge)
    #Retorno el grafo
    return grafo

def busquedaenanchura(grafo, costo, principio, destino):
    """
    Algoritmo de búsqueda en anchura para encontrar el camino más corto entre dos nodos en un grafo.
    ------------------------------------------------------------------------------------------------
    Argumentos:
        grafo (list): Lista de adyacencia que representa el grafo.
        costo (dict): Diccionario que mapea una tupla de nodos a un costo.
        principio (int): Nodo de inicio para la búsqueda.
        destino (int): Nodo de destino para la búsqueda.
    -------------------------------------------------------------------------------------------------
    Retorna:
        Una tupla con el costo mínimo para llegar al destino y el camino más corto.
    """
    # Inicializa la cola con el nodo de principio, distancia 0 y una lista vacía para el camino.
    cola = [(0, principio, [])]
    # Inicializa un conjunto para llevar un registro de los nodos visitados.
    atracciones_visitadas = set()
    # Mientras haya elementos en la cola:
    while cola:
        # Desencola el primer elemento de la cola, que contiene la distancia, el nodo actual y el camino.
        (distancia, nodo_actual, camino) = cola.pop(0)
        # Si se llegó al nodo final, devuelve la distancia y el camino.
        if nodo_actual == destino:
            return distancia, camino + [nodo_actual]
        # Si ya se visitó este nodo, continúa con el siguiente.
        if nodo_actual in atracciones_visitadas:
            continue
        # Marca el nodo actual como visitado.
        atracciones_visitadas.add(nodo_actual)
        # Para cada vecino del nodo actual:
        for vecino in grafo[nodo_actual]:
            # Obtiene el costo para ir desde el nodo actual al vecino.
            costo_vecino = costo.get((nodo_actual, vecino), 25)
            # Encola el vecino, sumando el costo al camino y a la distancia.
            cola.append((distancia + costo_vecino, vecino, camino + [nodo_actual]))
    # Si no se encontró un camino al nodo destino, devuelve una distancia infinita y una lista vacía para el camino.
    return float('inf'), []


def menu_selector_atracciones():
    """
    Imprime el menú de selección de atracciones de Manhattan y solicita al usuario una opción. 
    Si la opción es válida, actualiza la ubicación y limpia la pantalla. Si no, sigue solicitando una opción.
    -------------------------------------------------------------------
    Argumentos:
        No tiene argumentos
    -------------------------------------------------------------------
    Retorna:
        int: ubicación seleccionada por el usuario
    """
    ubicacion=" "
    print("Selecciona una opcion:")
    #Para solicitar continuamente opciones hasta que se seleccione una opción válida
    while True:
        # se llama a la función atracciones_new_york para obtener la opción seleccionada por el usuario
        eleccion = atracciones_new_york()
        #Si se selecciona una ubicación válida, se utiliza el módulo os para limpiar la pantalla y luego se sale del bucle while
        if eleccion == 0:
            ubicacion=0
            os.system("cls")
            break
        if eleccion == 1:
            ubicacion=1
            os.system("cls")
            break
        if eleccion == 2:
            ubicacion=2
            os.system("cls")
            break
        if eleccion == 3:
            ubicacion=3
            os.system("cls")
            break
        if eleccion == 4:
            ubicacion=4
            os.system("cls")
            break
        if eleccion == 5:
            ubicacion=5
            os.system("cls")
            break
        if eleccion == 6:
            ubicacion=6
            os.system("cls")
            break
        if eleccion == 7:
            ubicacion=7
            os.system("cls")
            break
        if eleccion == 8:
            ubicacion=8
            os.system("cls")
            break
        if eleccion == 9:
            ubicacion=9
            os.system("cls")
            break
        if eleccion == 10:
            ubicacion=10
            os.system("cls")
            break
        if eleccion == 11:
            ubicacion=11
            os.system("cls")
            break
        if eleccion == 12:
            ubicacion=12
            os.system("cls")
            break
        if eleccion == 13:
            ubicacion=13
            os.system("cls")
            break
        if eleccion == 14:
            ubicacion=14
            os.system("cls")
            #rompo ciclo reptitivo
            break
        if eleccion == 15:
            ubicacion=15
            os.system("cls")
            break
        if eleccion == 16:
            ubicacion=16
            os.system("cls")
            break
        if eleccion == 17:
            ubicacion=17
            os.system("cls")
            break
        if eleccion == 18:
            ubicacion=18
            os.system("cls")
            break
        if eleccion == 19:
            ubicacion=19
            os.system("cls")
            break
        if eleccion==20:
            ubicacion=20
            sys.exit()
    #Retorna el número de la ubicación
    return ubicacion

def ubicaciones(camino_corto):
    """Devuelve una lista de los nombres de las ubicaciones en un camino corto.

    Recibe como argumento una lista de enteros que representan las ubicaciones en un camino corto 
    en la ciudad de Nueva York. Luego, para cada entero en la lista, se agrega el nombre de la 
    ubicación correspondiente a la lista camino_corto. 
    ----------------------------------------------------
    Args:
        camino_corto (list of int): Lista de enteros que representan ubicaciones en un camino corto.
    ----------------------------------------------------
    Returns:
        list of str: Lista de nombres de ubicaciones en el camino corto.
    """
    #recorre la lista camino_corto, para cada valor numérico i que encuentra
    for i in camino:
        #Agrega el nombre correspondiente de la ubicación turística a la posición dentro de la lista llamada camino_corto
        if(i==0):
            camino_corto.append("NYC Museum")
        elif(i==1):
            camino_corto.append("Strawberry Fields")
        elif(i==2):
            camino_corto.append("Central Park Zoo")
        elif(i==3):
            camino_corto.append("Plaza Hotel")
        elif(i==4):
            camino_corto.append("St Patrick Catedral")
        elif(i==5):
            camino_corto.append("Rockefeller")
        elif(i==6):
            camino_corto.append("Summit One")
        elif(i==7):
            camino_corto.append("Times Square")
        elif(i==8):
            camino_corto.append("Madamme Tussauds")
        elif(i==9):
            camino_corto.append("Port Autorithy")
        elif(i==10):
            camino_corto.append("Empire State Building")
        elif(i==11):
            camino_corto.append("Vessel")
        elif(i==12):
            camino_corto.append("The Edge")
        elif(i==13):
            camino_corto.append("Madison Square Garden")
        elif(i==14):
            camino_corto.append("Cryslier Building")
        elif(i==15):
            camino_corto.append("Flatiron Building")
        elif(i==16):
            camino_corto.append("Ice Cream Museum")
        elif(i==17):
            camino_corto.append("Brookyn Bridge")
        elif(i==18):
            camino_corto.append("September11 Memorial")
        elif(i==19):
            camino_corto.append("Wallstreet Bull")
    #Retorna la lista camino_corto
    return camino_corto

def menu_principal():
    """
    Muestra un menú interactivo para el usuario y devuelve la opción seleccionada.

    El menú contiene tres opciones: "Manhattan Fast", "Acerca de Manhattan Fast" y "Salir".
    El usuario puede navegar por las opciones con las teclas "w" (arriba) y "s" (abajo) o con los números "8" y "5".
    La opción seleccionada se resalta con colores. Cuando el usuario presiona "Enter", la función devuelve la opción seleccionada.
    ---------------------------------------------------------
    Argumentos:
        Ninguno
    ---------------------------------------------------------
    Retorna:
        int: el índice de la opción seleccionada (0 para "Manhattan Fast", 1 para "Acerca de Manhattan Fast" y 2 para "Salir")

    """
    print("Bienvenido a Manhattan Fast")
    #Derivada de la libreria colorama que me ayuda a colorear las opciones
    init()
    # Define los colores para las opciones seleccionadas y no seleccionadas
    selected_color = Fore.BLUE + "-" + Fore.WHITE + Style.BRIGHT + "-" + Fore.RED
    not_selected_color = Fore.RESET + Style.RESET_ALL
    #Se imprimen las opciones
    opciones = ["Manhattan Fast","Acerca de Manhattan Fast","Salir"]
    #Se inicializa la variable
    choice_menu = 0
    #Actualiza la pantalla y lee la entrada del usuario en cada iteración.
    while True:
        #Limpia la pantalla
        os.system("cls")
        for i, option in enumerate(opciones):
            #Se lee la entrada del usuario
            if i == choice_menu:
                print(selected_color+"⮕ " + option+not_selected_color)
            else:
                print(not_selected_color+"  " + option)
        #obtiene la tecla presionada por el usuario y se almacena en la variable "key".
        key = getch()
        #verifica si la tecla presionada es "w" y si la opción seleccionada actual es mayor a 0, si es así, la opcion seleccionada se decrementa en 1.
        if key == b"w" or key == b"8" and choice_menu > 0:
            choice_menu -= 1
        #verifica si la tecla presionada es "s" y si la opción seleccionada actual es menor al tamaño de las opciones - 1, si es así, la opcion seleccionada se incrementa en 1.
        elif key == b"s" or key == b"5" and choice_menu < len(opciones) - 1:
            choice_menu += 1
        #verifica si la tecla presionada es "Enter" y si es así, se sale del bucle y se devuelve la opcion seleccionada.
        elif key == b"\r":
            return choice_menu

if __name__ == '__main__':
    """
    Programa principal para el proyecto "Manhattan Fast"
    """
    #Se reproduce la canción de la carpeta "Empire State Of Mind"
    reproducir_cancion("./newyorksong.mp3")
    #El Grafo se inicializa llamando a la función nodos_unidos()
    grafo=nodos_unidos()
    #Se limpia la pantalla
    os.system("cls")
    #Bucle donde el usuario escoge su opción
    while True:
        #La opción se elige del menú principal
        opcion = menu_principal()
        #Si eligió la opción Manhattan Fast.
        if opcion == 0:
            #El usuario debe seleccionar su punto de partida
            print("Selecciona tu punto de partida")
            #el nodo inicial debe encontrarse en el menú de atracciones
            punto_principio = menu_selector_atracciones()
            #Se limpia la pantalla
            os.system("cls")
            #el nodo final debe encontrarse en el menú de atracciones
            punto_final = menu_selector_atracciones()
            #crea un diccionario vacío que se utiliza para almacenar los costos de llegar a cada nodo en el grafo.
            costo = {}
            #realiza una búsqueda en anchura en el grafo para encontrar el camino más corto entre los nodos punto_principio y punto_final, y devuelve dos valores: el costo total del camino más corto (costo_1) y una lista de los nodos que forman ese camino (camino).
            costo_1, camino = busquedaenanchura(grafo, costo, punto_principio, punto_final)
            #Crea una lista vacía llamada
            camino_corto = []
            #Devuelve una lista con los nombres de las ubicaciones correspondientes a cada nodo en el camino.
            camino_corto = ubicaciones(camino_corto)
            #imprime en pantalla el orden en que se deben visitar las ubicaciones (camino_corto) y el costo total del recorrido (costo_1), en formato de dólares.
            print("El órden que debes seguir es el siguiente:", camino_corto,", el gasto aproximado para realizar este recorrido es: $",costo_1,"\n")
            os.system("pause")
        #Si eligió la opción "Acerca de:"
        if opcion == 1:
            #Se limpia la pantalla
            os.system("cls")
            #Se imprime el título
            print("Acerca de Manhattan Fast\n")
            #Se imprime lo que es el aplicativo
            print(
            """Como residentes o turístas en la Ciudad De Nueva York, específicamente en el Distrito de
Manhattan nos enfrentamos muchas veces al desafío de visitar el mayor número de atracciones 
turísticas, monumentos imponentes y emblemáticos lugares de película que se ubican en distintos
puntos de la ciudad, en el menor tiempo posible y/o de la manera más rápida y óptima para el
turista en general. 

De este pensamiento es como surge la idea de Manhattan Fast un proyecto que calcula la ruta más
rápida para visitar la mayor cantidad de lugares, tal y como requiera el usuario (teniendo un punto
de principio y un punto destinoal), así tambien calculando el costo aproximando en dólares ($) del recorrido,
en este coste está incluído entradas/souvenirs/comida/fotos.

El objetivo del aplicativo es brindarle una ayuda al usuario para que tenga una óptima y rica experiencia
conociendo la Gran Manzana.
            """)
            #Impresión del copyright
            print("Copyright © 2023 - Ednan Josué Merino Calderón")
            print("\nTodos los derechos reservados\n")
            os.system("pause")
        #Si eligió la opción salir
        if opcion == 2: 
            #Se cierra el programa
            sys.exit()
        if opcion == 3:
            #Se rompe el bucle
            break
