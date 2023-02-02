"""
    Juego de Adivinanzas por etapas 

    Autor: Ednan Josué Merino Calderón

    Versión: 1.1
"""
import random
#Clase etapa 1
class Etapa1:
    def __init__(self):
        #Se define el rango de la etapa 1, entre 1 y 10
        self.LOWER = 1
        self.HIGHER = 10
    #Método para generar número randómico
    def obtener_randomico(self):
        return random.randint(self.LOWER, self.HIGHER)
    #Se inicia el método
    def iniciar(self):
        numero_randomico = self.obtener_randomico()
        print("Bienvenido a la Etapa 1")
        print(
            f"Adivina el número generado entre {self.LOWER} y {self.HIGHER}")
        #Inicia los intentos
        intentos = 0
        #Ciclo While para el ingreso de datos
        while True:
            #Se le pide al usuario que ingrese el número
            numero_usuario = int(input("Ingrese un número: "))
            #Si es que el número ingresado por el usuario es igual al número randómico
            if numero_usuario == numero_randomico:
                #Se imprime que está correcto
                print("CORRECTO!")
                #Se inicializa la etapa 2
                Etapa2.iniciar()
                break
            #Si es que el usuario se pasa los 5 intentos
            elif intentos>3:
                #Se le notifica al usuario que perdió
                print("Se acabó el juego, pierde el juego")
                break
            #Si el numero ingresado por el usuario es menor al número randómico 
            elif numero_usuario < numero_randomico:
                print("No es el número pensado")
            #Si el numero ingresado por el usuario es mayor al número randómico 
            else:
                print("No es el número pensado")
            #Se suman los intentos
            intentos += 1
            
#Clase Etapa 2
class Etapa2:
    def __init__(self):
        #Se define el rango de la etapa 2, entre 1 y 20
        self.LOWER = 1
        self.HIGHER = 20
    #Método para generar número randómico
    def obtener_randomico(self):
        return random.randint(self.LOWER, self.HIGHER)
    #Se inicia
    def iniciar(self):
        #Se genera un numero randómico para ser adivinado
        numero_randomico = self.obtener_randomico()
        print("Bienvenido a la Etapa 2")
        print(
            f"Adivina el número generado entre {self.LOWER} y {self.HIGHER}")
        #Se inicializan las intentos
        intentos = 0
        #Ciclo While para el ingreso de datos
        while True:
            #Se le pide al usuario que ingrese el número
            numero_usuario = int(input("Ingrese un número: "))
            #Si es que el número ingresado por el usuario es igual al número randómico
            if numero_usuario == numero_randomico:
                #Se imprime que está correcto
                print("CORRECTO!")
                #Se inicia la etapa 3
                Etapa3.iniciar()
                break
            #Si el usuario exhede el número de intentos
            elif intentos>3:
                #Se le notifica al usuario que perdió
                print("Se acabó el juego, pierde el juego")
                break    
            #Si el usuario ingresa un número menor al randómico generado
            elif numero_usuario < numero_randomico:
                print("No es el número pensado")
            #Si el usuario ingresa un número mayor al randómico generado
            else:
                print("No es el número pensado")
            intentos += 1           
            
#Clase Etapa 3
class Etapa3:
    def __init__(self):
        #Se define el rango de la etapa 3, entre 1 y 30
        self.LOWER = 1
        self.HIGHER = 30
    #Método para generar número randómico
    def obtener_randomico(self):
        return random.randint(self.LOWER, self.HIGHER)
    #Se inciia
    def iniciar(self):
        #Se genera el número randómico para ser adivinado
        numero_randomico = self.obtener_randomico()
        print("Bienvenido a la Etapa 3")
        print(
            f"Adivina el número generado entre {self.LOWER} y {self.HIGHER}")
        #Se inicializan los intentos
        intentos = 0
        #Ciclo While para el ingreso de datos
        while True:
            #Se le pide al usuario que ingrese el número
            numero_usuario = int(input("Ingrese un número: "))
            #Si es que el número ingresado por el usuario es igual al número randómico
            if numero_usuario == numero_randomico:
                #Se imprime que gabó el juego
                print("Ganaste el juego con 3 puntos")
                break
            #Si el usuario exhede el número de intentos
            elif intentos>3:
                #Se le notifica al usuario que perdió
                print("Se acabó el juego, pierde el juego")
                break
            #Si el usuario ingresa un número menor al randómico generado
            elif numero_usuario < numero_randomico:
                print("No es el número pensado")
            #Si el usuario ingresa un número mayor al randómico generado
            else:
                print("No es el número pensado")
            intentos += 1

Etapa1 = Etapa1()
Etapa2 = Etapa2()
Etapa3 = Etapa3()
#Empieza el juego
Etapa1.iniciar()