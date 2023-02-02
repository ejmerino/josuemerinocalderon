"""
Veinte problemas básicos en Python

Autor: Ednan Josué Merino Calderón

Versión: 1.0
"""
import numpy
import math

def paralelogramo():
    """
    Función Que Calcula el área y perímetro de un paralelogramo
    ---------
    Parámetros:
    Base= Número float ingresado por el usuario
    Altura= Número float ingresado por el usuario
    ---------
    Retorna:
    Area y Perímetro de un paralelogramo
    ---------
    """
    #Se inicia un bucle
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un tipo de dato float y se almacena en la variable base
            base = float(input("Ingrese la base:"))
            #break
            break
        #Si el usuario no ingresó un tipo de dato float
        except ValueError:
            #Se le notifica al usuario que ingresó un dato incorrecto
            print("Ingrese un dato válido!")
    #Se inicia un bucle
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un tipo de dato float y se almacena en la variable altura
            altura = float(input("Ingrese la altura:"))
            #break
            break
        #Si el usuario no ingresó un tipo de dato float
        except ValueError:
            #Se le notifica al usuario que ingresó un dato incorrecto
            print("Ingrese un dato válido!")
    #Si es que el cilindro existe la base y la altura son mayores que 0
    if base>0 and altura >0:
        #Cálculo del perímetro
        perimetro=altura+altura+base+base
        #Se imprime la solución del perímetro
        print("El perímetro del paralelogramo es:",perimetro,"u")
        #Cálculo del área
        area=base*altura
        #Se imprime la solución del área
        print("El área del paralelogramo es:",area, "u^2")
    #Si el cilindro no existe
    else:
        #Se le notifica al usuario
        print("El paralelogramo no existe!")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza de nuevo
        paralelogramo()

def cilindro():
    """
    Función para calcular el área de un cilindro
    -------------------------------------------
    Parámetros:
    radio: valor float ingresado por el usuario
    altura_cilindro: valor float ingresado por el usuario
    -------------------------------------------
    Retorna:
    area_cilindro: valor en unidades cuadradas, resultado del área del cilindro
    """
    #Se inicia un bucle
    while True:
        #Se emplea la sentencia try/except para validar datos
        try:
            #El usuario ingresa el radio de tipo float en la variable radio
            radio = float(input("Ingrese el radio:"))
            #break
            break
        #Si es que el usuario ingresa cualquier otro dato que no sea de tipo float
        except ValueError:
            #Se le notifica al usuario que ingreso un dato erroneo
            print("Ingrese un dato válido!")
    #Se inicia otro bucle para la variable altura_cilindro
    while True:
        #Se emplea la sentencia try/except para validar datos
        try:
            #El usuario ingresa la altura de tipo float en la variable altura_cilindro
            altura_cilindro = float(input("Ingrese la altura:"))
            #break
            break
        #Si es que el usuario ingresa cualquier otro dato que no sea de tipo float
        except ValueError:
            #Se le notifica al usuario que ingreso un dato erroneo
            print("Ingrese un dato válido!")
    #Si es que el radio y altura ingresados por el usuario son mayores que 0
    if radio>0 and altura_cilindro > 0:
        #Se realiza la operación para encontrar el area del cilindro
        area_cilindro = 2*math.pi*radio*(radio+altura_cilindro)
        #Se imprime la solución
        print("El área del cilindro es:",area_cilindro,"u^2")
    #Si es que el radio y la altura del cilindro son menores que 0
    else:
        #Se le notifica al usuario que el cilindro no existe
        print("El cilindro no existe")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se vuelve a empezar
        cilindro()

def area_circulo():
    """
    Función para encontrar el área de un círculo
    --------------------------------------------
    Parámetros:
    radio: Dato float ingresado por el usuario
    --------------------------------------------
    Retorna:
    area_del_círculo: Valor en unidades cuadradas correspondiente al área de un círculo
    """
    #Se inicia un bucle
    while True:
        #Se emplea la sentencia try/except para validad datos
        try:
            #El usuario ingresa un dato tipo float que se almacena en la variable radio
            radio = float(input("Ingrese un radio para calcular el área:"))
            #break
            break
        #Si es que el usuario ingresa cualquier otro tipo de dato que no sea float
        except ValueError:
            #Se le notifica al usuario que ingreso un dato incorrecto
            print("Ingrese un número válido")
    #Si el radio es mayor que 0 el área del círculo existe
    if radio>0:
        #Cálculo del área del círculo
        area_del_circulo = math.pi*(radio**2)
        #Se imprime la solución
        print("El área del círculo es:",area_del_circulo,"u^2")
    #Si el radio es menor que 0, el área no existe
    else:
        #Se le notifica al usuario que el círculo no existe
        print("El círculo no existe")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza desde el comienzo
        area_circulo()

def potencia():
    """
    Función que sirve para calcular la potencia de cualquier número
    ---------------------------------------------------------------
    Parámetros:
    x: Base de una potencia 
    y: Exponente de una potencia
    ---------------------------------------------------------------
    Retorna:
    potencia_numero: Potencia x^y
    """
    #Se inicia un bucle para la variable x
    while True:
        #Sentencia try/except para validad datos
        try:
            #El usuario ingresa un valor float que se almacena en la variable x
            x=float(input("Ingrese una base x:"))
            #break
            break
        #Si es que el usuario no ingresó un número float
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Se inicia un bucle para la variable y
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un valor float que se almacena en la variable y
            y=float(input("Ingrese un exponente y:"))
            #break
            break
        #Si el usuario no ingresó un valor float
        except ValueError:
            #Se le notifica al usuario que ingresó un dato inválido
            print("Ingrese un dato válido!")
    #Se calcula la potencia del número
    potencia_numero = x**y
    #Se imprime la solución
    print("La potencia x^y es igual a:",potencia_numero)

def saludo():
    """
    Función que sirve para pedirle el nombre al usuario y saludarlo
    ---------------------------------------------------------------
    Parámetros:
    nombre: dato str ingresado por el usuario
    ---------------------------------------------------------------
    Retorna:
    Saludo
    """
    #Bucle para la variable nombre
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa su nombre y se almacena en la variable nombre
            nombre=str(input("Ingrese su nombre:"))
            #break
            break
        #Si el usuario no ingresó un tipo de dato str
        except ValueError:
            #Se le comunica al usuario que no ingresó un dato válido
            print("Ingrese un dato válido!")
    #Se imprime la solución
    print("Hola",nombre,"Bienvenido :)")

def volumen_esfera():
    """
    Función que permite calcular el volúmen de una esfera por medio de un radio ingresado por el usuario
    ----------------------------------------------------------------------------------------------------
    Parámetros:
    radio_esfera: Datos float ingresado por el usuario
    ----------------------------------------------------------------------------------------------------
    Retorna:
    volumen: Volumen de la esfera
    """
    #Bucle True para la variable radio_esfera
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa un dato float y se almacena en la variable radio_esfera
            radio_esfera=float(input("Ingrese el radio para calcular el volúmen de una esfera:"))
            #break
            break
        #Si el usuario no ingresó un tipo de dato float
        except ValueError:
            #Se le notifica al usuario que se equivocó de dato
            print("Ingrese un dato válido!")
    #Si la esfera existe el radio es mayor a 0
    if radio_esfera>0:
        #Se calcula el volúmen
        volumen=4/3*math.pi*(radio_esfera**3)
        #Se imprime la solución
        print("El volumen de la esfera es:",volumen,"u^3")
    #Si el radio es menor a 0 la esfera no existe
    else:
        #Se le notifica al usuario que la esfera no existe
        print("La esfera no existe")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se repite el proceso
        volumen_esfera()

def area_perimetro_rectangulo():
    """
    Se Calcula el área y perímetro de un rectángulo
    -----------------------------------------------
    Parámetros:
    altura: Altura del rectángulo ingresado por el usuario
    base: Base del rectángulo ingresado por el usuario
    -----------------------------------------------
    Retorna:
    area_del_rectangulo: Calculando BasexAltura
    perimetro_del_rectangulo: Calculando 2Base+2Altura
    """
    #Bucle para la variable altura
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un dato float y se almacena en la variable altura
            altura=float(input("Ingrese la altura:"))
            #break
            break
        #Si el usuario no ingresó un valor float
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable base
    while True:
        #Sentecia try/except para validar datos
        try:
            #El usuario ingresa un dato float y se almacena en la variable base
            base=float(input("Ingrese la base:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Si el rectángulo existe la base y la altura deben ser mayores a 0
    if base >0 and altura >0:
        #Cálculo area del rectángulo
        area_del_rectangulo=base*altura
        #Se imprime la solución del área del rectángulo
        print("El área del rectángulo es:",area_del_rectangulo,"u^2")
        #Cálculo perímetro del rectángulo
        perimetro_del_rectangulo=base+base+altura+altura
        #Se imprime la solución del perímetro del rectángulo
        print("El perímetro del rectángulo es:",perimetro_del_rectangulo,"u")
    #Si el rectángulo no existe
    else:
        #Se le notifica al usuario que el rectángulo no existe
        print("El rectángulo no existe")
        #Se le anima al usuario a intentarlo de nuevo
        print("Inténtelo de nuevo!")
        #Se vuelve a empezar
        area_perimetro_rectangulo()

def pitagoras_hipotenusa():
    """
    Función que calcula la hipotenusa en un triángulo rectángulo
    ------------------------------------------------------------
    Parámeteros:
    cateto_1: Cateto 1 ingresado por el usuario
    cateto_2: Cateto 2 ingresado por el usuario
    ------------------------------------------------------------
    Retorna:
    hipotenusa: Se calcula la hipotenusa
    """
    #Bucle para la variable cateto_1
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un dato float y se almacena en la variable cateto_1
            cateto_1=float(input("Ingrese el valor de un cateto:"))
            #break
            break
        #El usuario no ingreso un dato correcto
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable cateto_2
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un dato float y se almacena en la variable cateto_2
            cateto_2=float(input("Ingrese el valor del otro cateto:"))
            #break
            break
        #El usuario no ingresó un dato correcto
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Para que el rectángulo exista el cateto 1 y el cateto 2 deben ser mayores a 0
    if cateto_1 >0 and cateto_2 > 0:
        #Cálculo de la hipotenusa
        hipotenusa=math.sqrt(cateto_1**2+cateto_2**2)
        #Solución de la hipotenusa
        print("La hipotenusa es:",hipotenusa)
    #Si el triángulo no existe
    else:
        #Se le notifica al usuario que el triángulo no existe
        print("El triángulo no existe")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza desde el comienzo
        pitagoras_hipotenusa()

def pitagoras_cateto():
    """
    Función para calcular el cateto faltante en un triángulo rectángulo
    -------------------------------------------------------------------
    Parámetros:
    cateto: Cateto ingresado por el usuario
    hipotenusa: Hipotenusa ingresado por el usuario
    -------------------------------------------------------------------
    Retorna:
    cateto_faltante: Cateto que hace falta
    """
    #Bucle para la variable cateto
    while True:
        #sentencia try/except para validar datos
        try:
            #El usuario ingresa un dato float que se almacena en la variable cateto
            cateto=float(input("Ingrese el valor de un cateto:"))
            #break
            break
        #Si el usuario ingresó un valor incorrecto
        except ValueError:
            #Se le notifica al usuario que ingresó un dato inválido
            print("Ingrese un dato válido!")
    #Bucle para la variable hipotenusa
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa un dato float que se almacena en la variable hipotenusa
            hipotenusa=float(input("Ingrese el valor de la hipotenusa:"))
            #break
            break
        #Si el usuario ingresó un dato incorrecto
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido!")
    #Si el triángulo existe la hipotenusa y el cateto es mayor que 0
    if hipotenusa >0 and cateto >0:
        #Cálculo del cateto faltante
        cateto_faltante=math.sqrt(hipotenusa**2-cateto**2)
        #Se imprime la solución
        print("El cateto faltante es:",cateto_faltante)
    #Si el triángulo no existe
    else:
        #Se le notifica al usuario que el triángulo no existe
        print("El triángulo no existe")
        #Se le notifica al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #se empieza desde el comienzo
        pitagoras_cateto()

def pitagoras_menu():
    """
    Menu para que el usuario elija que tipo de cálculo Pitagórico requiere
    ---------------------------------------------------------------------
    Parámetros:
    opción_pitagoras: Dato ingresado según requiera el usuario
    ---------------------------------------------------------------------
    Retorna:
    pitagoras_hipotenusa
    pitagoras_cateto
    """
    #Se inicializa la variable opcion_pitagoras
    opcion_pitagoras=""
    #Bucle, mientras la opcion escogida sea diferente de cuatr0
    while opcion_pitagoras != "4":
        #Se imprime el menu
        pitagoras_menu= """
        MENU PITAGORAS
        --------------
        1. Calcular Hipotenusa
        2. Calcular Cateto Faltante
        3. Volver al menú principal
        --------------
        Elija su opcion:
        """
        #El usuario ingresa la opción que desea
        opcion_pitagoras = input(pitagoras_menu)
        #Si la opción elegida es 1
        if opcion_pitagoras=="1":
            #Se llama a la función para calcular la hipotenusa
            pitagoras_hipotenusa()
            #break
            break
        #Si la opción elegida es 2
        if opcion_pitagoras=="2":
            #Se llama a la función para calcular el cateto faltante
            pitagoras_cateto()
            #break
            break
        #Si la opción elegida es 3
        if opcion_pitagoras=="3":
            #Se vuelve al menú principal
            menu()

def calculo_expresion():
    """
    Función para calcular la expresión y=x^z/2
    ------------------------------------------
    Parámetros:
    x: Dato float ingresado por el usuario es la base de la potencia
    z: Dato float ingresado por el usuario es el exponente de la potencia
    ------------------------------------------
    Retorna:
    expresion: Resultado de la expresión
    """
    #Bucle para la variable x
    while True:
        #Sentencia try/except para validación de daots
        try:
            #El usuario ingresa un valor float y se almacena en la variable x
            x=float(input("Ingrese el valor de x:"))
            #break
            break
        #Si el usuario ingreso un dato inválido
        except ValueError:
            #Se le comunica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable z
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa un valor float y se almacena en la variable z
            z=float(input("Ingrese el valor de z:"))
            #break
            break
        #Si el usuario ingresa un dato inválido
        except ValueError:
            #Se le comunica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Cálculo de la expresión
    expresion=(x**z)/2
    #Se imprime la solución
    print("La expresión es igual a y=",expresion)

def velocidad_fisica():
    """
    Función para calcular la velocidad, teniendo el tiempo y la distancia
    ---------------------------------------------------------------------
    Parámetros:
    tiempo: Dato ingresado por el usuario
    distancia: Dato ingresado por el usuario
    ---------------------------------------------------------------------
    Retorna:
    velocidad: Cálculo de la distancia dividida para el tiempo
    """
    #Bucle para la variable tiempo
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el tiempo y se almacena en la variable tiempo
            tiempo=float(input("Ingrese el tiempo en segundos:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable distancia
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa la distancia y se almacena en la variable distancia
            distancia=float(input("Ingrese la distancia en metros:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido")
    #Si la distancia y el tiempo son mayores a cero la rapidez existe
    if distancia > 0 and tiempo >0:
        #Cálculo de la velocidad
        velocidad=distancia/tiempo
        #Se imprime la solución
        print("La rapidez es igual a:",velocidad,"m/s^2")
    #Si la rapidez no existe
    else:
        #Se le informa al usuario que no existe la rapidez
        print("No existen tiempos y/o distancias negativas")
        #Se le dice al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!")
        #Se repite le proceso
        velocidad_fisica()

def calculo_densidad():
    """
    Función para calcular la densidad de un objeto
    ----------------------------------------------
    Parámetros:
    masa: Valor ingresado por el usuario
    volumen: Valor ingresado por el usuario
    """
    #Bucle para la variable masa
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa el dato de la masa
            masa=float(input("Ingrese la masa del objeto en kgs:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable volumen
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa el dato del volúmen
            volumen=float(input("Ingrese el volumen en m^3:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Si la densidad existe
    if masa>0 and volumen >0:
        #Cálculo de la densidad
        densidad=masa/volumen
        #Se imprime la solución
        print("La densidad es igual a:",densidad,"kg/m^3")
    #Si la densidad no existe
    else:
        #Se le notifica al usuario que la densidad no existe
        print("No existen masa y/o volumen menor o igual a 0")
        #Se le alienta al usuario a empezar de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza de nuevo
        calculo_densidad()

def conversion_dias():
    """
    Función para convertir días en años,meses y semanas
    ---------------------------------------------------
    Parámetro:
    dias: Dato ingresado por el usuario
    ---------------------------------------------------
    Retorna:
    años: dias convertidos en años
    meses: dias convertidos en meses
    semanas: dias convertidos en semanas
    """
    #Bucle para la variable dias
    while True:
        #Sentencia try/except para validar datos
        try:
            #El usuario ingresa el número de días
            dias=int(input("Ingrese el número de días:"))
            #break
            break
        #Si el usuario ingresó un dato equivocado
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido")
    #Si la conversión puede realizarse
    if dias >= 0:
        #Conversión a años
        años=dias//365
        #Se imprime los dias trasnformados en años
        print(dias,"días son:",años,"años")
        #Conversión a meses
        meses=dias//30
        #Se imprime los días transformados en meses
        print(dias,"días son:",meses,"meses")
        #Conversión a semanas
        semanas=dias//7
        #Se imprime los días transformados en semanas
        print(dias,"días son:",semanas,"semanas")
    #Si no se puede realizar la conversión
    else:
        #Se le notifica al usuario que ingrese un dato válido
        print("Ingrese un dato válido")
        #Se alienta al usuario a empezar de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza de nuevo
        conversion_dias()

def conversion_longitud():
    """
    Función para convertir cm en m y km
    -----------------------------------
    Parámetros:
    centimetros: Dato ingresado por el usuario
    -----------------------------------
    Retorna:
    metros: cm transformados en m
    kilometros: cm transformados en km
    """
    #Bucle para la variable centímetros
    while True:
        #Sentencia para validación de datos
        try:
            #El usuario ingresa el valor de los centímetros
            centimetros=int(input("Ingrese la longitud en cm:"))
            #break
            break
        #Si el usuario no ingresó un valor correcto
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido")
    #Si la conversión puede realizarse
    if centimetros>=0:
        #Conversión a metros
        metros=centimetros/100
        #Se imprime la conversión a metros
        print(centimetros,"cm son:",metros,"m")
        #Conversión a kilómetros
        kilometros=centimetros/1000
        #Se imprime la conversión a kilómetros
        print(centimetros,"cm son:",kilometros,"km")
    #Si la conversión no puede realizarse
    else:
        #Se le notifica al usuario que no puede realizarse la conversión
        print("Ingrese un valor mayor o igual a 0")
        #Se alienta al usuario a empezar de 0
        print("Inténtelo de nuevo!")
        #Se inicia de nuevo el proceso
        conversion_longitud()

def conversion_celcius():
    """
    Función para convertir °C a °F
    ------------------------------
    Parámetros:
    celsius: Dato ingresado por el usuario
    ------------------------------
    Retorna:
    fahrenheit: °C convertidos a °F
    """
    #Bucle para la variable celsius
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa los grados celsius
            celsius=float(input("Ingrese la temperatura en °C:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que ingresó un dato inválido
            print("Ingrese un dato correcto!")
    #Conversión a °F
    fahrenheit=(celsius*9/5)+32
    #Imprime la conversión
    print(celsius,"°C son:",fahrenheit,"°F")

def conversion_fahrenheit():
    """
    Función para convertir °F a °C
    ------------------------------
    Parámetros:
    fahrenheit: Dato ingresado por el usuario
    ------------------------------
    Retorna:
    celcius: Conversión de °F a °C
    """
    #Bucle para la variable fahrenheit
    while True:
        #Sentencia trry/except para validación de datos
        try:
            #El usuario ingresa los °F
            fahrenheit=float(input("Ingrese la temperatura en °F:"))
            #break
            break
        #Si el usuario no ingresó un dato válido
        except ValueError:
            #Se le notifica al usuario que ingresó un dato erroneo
            print("Ingrese un dato válido!")
    #Conversión de °F a °C
    celcius=(fahrenheit-32)*5/9
    #Se imprime la conversión a °C
    print(fahrenheit,"°F son:",celcius,"°C")

def menu_temperatura():
    """
    Función de menú para que el usuario escoja que transformación quiere realizar
    -----------------------------------------------------------------------------
    Parámetros:
    opcion_temperatura: Opción que escoja el usuario según requiera
    Retorna:
    conversion_celsius
    conversion_fahrenheit
    """
    #Se inicializa la variable opcion_temperatura
    opcion_temperatura=""
    #Bucle mientras la opción no sea 4
    while opcion_temperatura != "4":
        #Se imprime el menú
        menu_temperatura= """
        MENU TEMPERATURA
        --------------
        1. Convertir de °C a °F
        2. Convertir de °F a °C
        3. Volver al menú principal
        --------------
        Elija su opcion:
        """
        #El usuario ingresa la conversión que requiera
        opcion_temperatura = input(menu_temperatura)
        #Si escogió 1
        if opcion_temperatura=="1":
            #Se llama a la función conversión a celcius
            conversion_celcius()
            #break
            break
        #Si escogió la opción 2
        if opcion_temperatura=="2":
            #Se llama a la función conversión a fahrenheit
            conversion_fahrenheit()
            #break
            break
        #Si escogió la opción 3
        if opcion_temperatura=="3":
            #Se retorna al menú principal
            menu()

def convertir_libras():
    """
    Función para convertir libras a kilos y gramos
    ----------------------------------------------
    Parámetros:
    libras: Dato ingresado por el usuario
    ----------------------------------------------
    Retorna:
    kilos: Conversión de lbs a kg
    gramos: Conversión de lbs a g
    """
    #Bucle para la variable libras
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el número de libras
            libras=float(input("Ingrese el valor en libras:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Si la conversión de libras es posible realizarse
    if libras >=0:
        #Conversión de libras a kilos
        kilos=libras/2.2046
        #Se imprime la conversion de libras a kilos
        print(libras,"lbs son:",kilos,"kg")
        #Conversión de libras a gramos
        gramos=libras*453.59237
        #Se imprime la conversión de libras a gramos
        print(libras,"lbs son:",gramos,"g")
    #Si la conversión no puede realizarse
    else:
        #Se le notifica al usuario que ingrese un valor igual o mayor a 0
        print("Ingrese un valor igual o mayor a 0")
        #Se anima al usuario a intentarlo de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza desde el comienzo
        convertir_libras()

def raiz_cuadrada():
    """
    Función para encontrar la raiz cuadrada de cualquier número
    -----------------------------------------------------------
    Parámetros:
    número: Dato ingresado por el usuario
    -----------------------------------------------------------
    Retorna:
    raiz: Raíz cuadrada del número ingresado
    """
    #Bucle para la variable numero
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa un número
            numero=float(input("Ingrese un número:"))
            #break
            break
        #Si el usuario no ingresó un dato válido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido!")
    #Si la raíz es de un número natural
    if numero >=0:
        #Cálculo de la raíz
        raiz=math.sqrt(numero)
        #Se imprime la solución de la raíz
        print("La raíz cuadrada de:",numero,"es:",raiz)
    #Si la raíz cuadrada es un número imaginario
    else:
        #Cálculo de la raíz
        raiz2=math.sqrt(numero*(-1))
        #Se imprime la solución de la raíz imaginaria
        print("La raíz cuadrada de:",numero,"es:",raiz2,"i")

def encontrar_angulo():
    """
    Función para encontrar el ángulo restante de un triángulo
    ---------------------------------------------------------
    Parámetros:
    angulo_1: Dato ingresado por el usuario
    angulo_2: Dato ingresado por el usuario
    ---------------------------------------------------------
    Retorna:
    angulo_faltante: El ángulo que falta del triángulo
    """
    #Bucle para la variable angulo_1
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el ángulo 1
            angulo_1=float(input("Ingrese el ángulo 1:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido!")
    #Bucle para la variable angulo_2
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el ángulo 2
            angulo_2=float(input("Ingrese el ángulo 2:"))
            #break
            break
        #Si el usuario ingresó in dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un valor válido!")
    #Se verifica que el triángulo exista
    if angulo_1>0 and angulo_2 > 0 and angulo_1+angulo_2 <180:
        #Cálculo del ángulo faltante
        angulo_faltante=180-(angulo_1+angulo_2)
        #Se imprime el ángulo faltante
        print("El ángulo faltante es:",angulo_faltante)
    #Si no existe el triángulo
    else:
        #Se le notifica al usuario que el triángulo no existe
        print("Los ángulos que usted ingresó no corresponden a un triángulo!")
        #Se le alienta al usuario a intentarlo de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza de nuevo desde 0
        encontrar_angulo()

def area_triangulo():
    """
    Función para controlar el área de un triángulo
    ----------------------------------------------
    Parámetros:
    base_triangulo: Dato ingresado por el usuario
    altura_triangulo: Dato ingresado por el usuario
    ----------------------------------------------
    Retorna:
    area_del_triangulo: Cálculo del área del triángulo
    """
    #Bucle para la variable base_triangulo
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa la base del triángulo
            base_triangulo=float(input("Ingrese la base de un triángulo:"))
            #break
            break
        #Si el usuario no ingresó un dato válido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Bucle para la variable altura_triangulo
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa la altura del triángulo
            altura_triangulo=float(input("Ingrese la altura de un triángulo:"))
            #break
            break
        #Si el usuario no ingresó un dato válido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato válido!")
    #Si el triángulo existe
    if base_triangulo>0 and altura_triangulo > 0:
        #Cálculo del área del triángulo
        area_del_triangulo=(base_triangulo*altura_triangulo)/2
        #Se imprime la solución del área del triángulo
        print("El área del triángulo es:",area_del_triangulo,"u^2")
    #Si el triángulo no existe
    else:
        #Se le notifica al usuario que el triángulo no existe
        print("El triángulo no existe")
        #Se alienta al usuario a intentarlo de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza desde el comienzo
        area_triangulo()

def aritmetica():
    """
    Función para calcular las cuatro operaciones básicas mediante dos números
    -------------------------------------------------------------------------
    Parámetros:
    numero_1: Dato ingresado por el usuario
    numero_2: Dato ingresado por el usuario
    -------------------------------------------------------------------------
    Retorna:
    suma
    resta
    multiplicación
    división
    """
    #Bucle para la variable numero_1
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el número 1
            numero_1=float(input("Ingrese el número 1:"))
            #break
            break
        #Si el usuario ingresó un dato inválido
        except ValueError:
            #Se le comunica al usuario que ingresó un dato inválido
            print("Ingrese un dato inválido!")
    #Bucle para la variable numero_2
    while True:
        #Sentencia try/except para validación de datos
        try:
            #El usuario ingresa el número 2
            numero_2=float(input("Ingrese el número 2:"))
            #break
            break
        #Si el usuario ingresa un dato inváliod
        except ValueError:
            #Se le comunica al usuario que ingresó un dato inválido
            print("Ingrese un dato inválido!")
    #Se imprimen las soluciones
    print("Las operaciones básicas con los números ingresados son:")
    #Cálculo de la suma
    suma=numero_1+numero_2
    #Impresión de la suma
    print(numero_1,"+",numero_2,"=",suma)
    #Cálculo de la resta
    resta=numero_1-numero_2
    #Impresión de la resta
    print(numero_1,"-",numero_2,"=",resta)
    #Cálculo de la multiplicación
    multiplicacion=numero_1*numero_2
    #Impresión de la multiplicación
    print(numero_1,"*",numero_2,"=",multiplicacion)
    #División que está determinada
    if numero_2 != 0:
        #Cálculo de la división
        division=numero_1/numero_2
        #Impresión de la división
        print(numero_1,"/",numero_2,"=",division)
    #División para 0
    else:
        #División indeterminada
        print(numero_1,"/",numero_2,"= ∞")

def circulo():
    """
    Función para encontrar el diámetro, la circunferencia y el área del círculo
    ---------------------------------------------------------------------------
    Parámetro:
    radio_circulo: Dato ingresado por el usuario
    ---------------------------------------------------------------------------
    Retorna:
    diametro
    circunferencia
    area
    """
    #Bucle para la variable radio_circulo
    while True:
        #Sentencia try/except
        try:
            #El usuario ingresa el radio del círculo
            radio_circulo=float(input("Ingrese el radio de un círculo:"))
            #break
            break
        #Si el usuario ingresa un dato inválido
        except ValueError:
            #Se le notifica al usuario que se equivocó
            print("Ingrese un dato corecto!")
    #Si el radio existe
    if radio_circulo > 0:
        #Cálculo del diámetro
        diametro=radio_circulo*2
        #Se imprime la solución del diámetro
        print("El diámetro del círculo de radio",radio_circulo,"es:",diametro,"u")
        #Cálculo de la circunferencia
        circunferencia=2*radio_circulo*math.pi
        #Impresión de la circunferencia
        print("El perímetro de la circunferencia es:",circunferencia,"u")
        #Cálculo del área del círculo
        area=math.pi*(radio_circulo**2)
        #Se imprime el resultado del área del círculo
        print("El área del círculo es:",area,"u^2")
    #Si no existe
    else:
        #Se le notifica al usuario que no es posible realizar los cálculos
        print("El radio no existe, elija un valor mayor que 0")
        #Se alienta al usuario a empezar de nuevo
        print("Inténtelo de nuevo!")
        #Se empieza de nuevo
        circulo()

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
    while opcion != "21":
        #menu se ejcutara
        menu = """
        LABORATORIO 1 PARCIAL 2 POR JOSUÉ MERINO
        ------------------------
        1. Ingrese su nombre
        2. Calcular el Perímetro y Area del Paralelogramo
        3. Calcular volúmen de un cilindro
        4. Calcular el área de un círculo
        5. Cálculo de potencias x^y
        6. Calcular Volúmen de una esfera
        7. Calcular el área de un rectángulo
        8. Teorema de Pitágoras
        9. Calcular la expresión y=(x^z)/2
        10. Calcular la rapidez
        11. Calculo densidad de un objeto
        12. Convertir días a años/meses/semanas
        13. Transformar cm a m y km
        14. Transformar de °F a °C o de °C a °F
        15. Convertir libras a kilos y gramos
        16. Hallar la raiz cuadrada de un número
        17. Hallar el ángulo faltante de un triángulo
        18. Hallar área de un triángulo
        19. Operaciones básicas con dos números
        20. Hallar datos del círculo        
        21. Salir
        ------------------------
        Elija su opción: """
        #opcion es igual a la entrada que debemos a menu
        opcion = input(menu)
        #si la opcion es 1
        if opcion=="1":
            #Se llama a la función saludo
            saludo()
            break
        #si la opcion es 2
        if opcion == "2":
            #Se llama a la función paralelogramo
            paralelogramo() 
            break           
        #Si la opcion es 3
        if opcion == "3":
            #Llamamos a la función cilindro
            cilindro()  
            break
        #Si la opción es 4
        if opcion == "4":
            #Se llama a la función area_circulo
            area_circulo()
            break
        #Si la opción es 5
        if opcion == "5":
            #Se llama a la función potencia
            potencia()
            break
        #Si la opción es 6
        if opcion=="6":
            #Se llama a la función volumen_esfera
            volumen_esfera()
            break
        #Si la opción es 7
        if opcion=="7":
            #Se llama a la función area y perímetro del rectángulo
            area_perimetro_rectangulo()
            break
        #Si la opción es 8
        if opcion=="8":
            #Se llama a la función menú de pitágoras
            pitagoras_menu()
            break
        #Si la opción es 9
        if opcion=="9":
            #Se llama a la función cálculo de la expresión
            calculo_expresion()
            break
        #Si la opción es 10
        if opcion=="10":
            #Se llama a la función para calcular la velocidad
            velocidad_fisica()
            break
        #Si la opción es 11
        if opcion=="11":
            #Se llama a la función para calcular la densidad
            calculo_densidad()
            break
        #Si la opción es 12 
        if opcion=="12":
            #Se llama a la función para convertir días en meses, años y semanas
            conversion_dias()
            break
        #Si la opción es 13
        if opcion=="13":
            #Se llama a la función para convertir la longitud
            conversion_longitud()
            break
        #Si la opción es 14
        if opcion=="14":
            #Se llama a la función para convertir la temperatura
            menu_temperatura()
            break
        #Si la opción es 15
        if opcion=="15":
            #Se llama a la función para convertir libras en g y kg
            convertir_libras()
            break
        #Si la opción es 16
        if opcion=="16":
            #Se llama a la función para encontrar la raíz cuadrada
            raiz_cuadrada()
            break
        #Si la opción es 17
        if opcion=="17":
            #Se llama a la función para encontrar el ángulo sobrante en un triángulo
            encontrar_angulo()
            break
        #Si la opción es 18
        if opcion=="18":
            #Se llama a la función para encontrar el área de un triángulo
            area_triangulo()
            break
        #Si la opción es 19
        if opcion=="19":
            #Se llama a la función para encontrar las operaciones básicas
            aritmetica()
            break
        #Si la opción es 20
        if opcion=="20":
            #Se llamaba la función para encontrar los componentes de un círculo
            circulo()
            break
#Es el main del aplicativo
if __name__=="__main__":
    #Llama a la función menú.
    menu()