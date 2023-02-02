"""
You parked your car in a parking lot and want to compute the total cost of the ticket. The billing rules are as follows:

The entrance fee of the car parking lot is 2;
The first full or partial hour costs 3;
Each successive full or partial hour (after the first) costs 4.
You entered the car parking lot at time E and left at time L. In this task, times are represented as strings 
in the format "HH:MM" (where "HH" is a two-digit number between 0 and 23, which stands for hours, and "MM" is a 
two-digit number between 0 and 59, which stands for minutes).

Autor: Josué Merino

Versión: 1.0
"""

import big_o

def entrada_de_datos():
    """
    Función donde se ingresan los datos para los respectivos cálculos, está debidamente validada 
    --------------------------------------------
    No tiene parámetros
    --------------------------------------------
    Retorna:
    dato
    """   
    
    #mientras sea verdadero se ingresara un dato en la variable dato, si lo que se ingreso es un dato entero
    #rompera el ciclo repetitivo while sino el usuario debera volver a ingresar un dato hasta que sea valido
    while True:
        try:
            dato=int(input())
            #break
            break
        except ValueError:
            print("Ingrese un dato correcto!",end="")
    return dato   

def sistema_parking():
    """
    Función que recupera los datos y la hora de entrada del vehículo
    ----------------------------------------------
    La función no tiene parámetros
    ----------------------------------------------
    Retorna el horario.
    """
    #ingreso la hora de entrada y la hora de salida
    
    print("Ingrese la hora en el formato HH:",end="")
    hora=entrada_de_datos()
    #Si la hora no se encuentra en el formato correcto
    while(hora<0 or hora>23):
        #Se le notifica al usuario que se equivocó y lo intente de nuevo       
        print("Ingrese en el formato correcto:",end="")
        #La variable hora utiliza la entrada de datos
        hora=entrada_de_datos()
    print("Ingrese los minutos en el formato MM:",end="")
    #La variable minuto utiliza la entrada de datos
    minuto=entrada_de_datos()
    #Si los minutos no se encuentran en el formato correcto
    while(minuto<0 or minuto>59):
        #Se le notifica al usuario que se equivocó y lo intente de nuevo
        print("Ingrese en el formato correcto:",end="")
        #La variable minuto utiliza la entrada de datos
        minuto=entrada_de_datos()
    #retorno la hora y minuto
    return hora,minuto

def parking_bill(horaE,minutoE,horaS,minutoS):
    """
    Funcion que está a cargo del cálculo del total a pagar por el estacionamiento
    -------------------------------------------------------
    Parametros:
    horaE : hora de entrada
    minutoE : minuto de entrada
    horaS : hora de salida
    minutoS : minuto de salida
    --------------------------------------------------------
    Retorna:
    bill: precio final
    """     
    #Se establece los precios
    #Precio de la hora
    hora_fracción=3
    #Precio por entrar al parqueadero
    valor_entrada=2
    #El valor final se inicializa
    bill=0
    #Se crea un incremento para el cobro de las horas
    incremento_hora=0

    #Si el vehículo no entra y sale del parking al mismo tiempo
    while(horaE!=horaS):
        #Se le suma una hora a la hora de entrada
        horaE=horaE+1
        #Crece el incremento
        incremento_hora=incremento_hora+1
        #Si el vehículo pasa media noche en el parking
        if(horaE==24):
            horaE=0
    #Si el minuto de saluda no es cero
    if(minutoS != 0 ):
        #Crece el incremento
        incremento_hora=incremento_hora+1
    #Si el vehículo estuvo nada más una hora
    if(incremento_hora==1):
        #El cobro del parking es la entrada más la hora fracción
        bill=hora_fracción+valor_entrada
    #Si el vehículo excede la hora de guardado 
    if(incremento_hora>=2):
        #se le cobra el valor de entrada más las horas que ocupa el sevicio
        bill=valor_entrada+hora_fracción+((incremento_hora-1)*4)
    #retornamos el valor de la factura a pagar
    return bill

if __name__ == '__main__':
    """
    Función que corre el aplicativo
    -------------------------------
    No tiene parámetros
    -------------------------------
    No retorna nada
    """
    #Se le pide al usuario su nombre
    nombre = str(input("Ingrese su nombre:"))
    #Se saluda
    print("Bienvenido", nombre)
    print("\nIngrese la hora de entrada")
    #La hora y minuto de entrada usan la función sistema_parking
    horaE,minutoE=sistema_parking()
    horaX = horaE
    #Se imprime la hora de entrada
    print("\nEntrada a las: ",horaE,":",minutoE)
    #La hora y minuto de salida usan la función sistema_parking
    print("\nIngrese la hora de salida")
    horaS,minutoS=sistema_parking()    
    #Se imprime la hora de salida
    print("Salida a las: ",horaS,":",minutoS)
    #Se imprime cuánto debe el usuario
    print("\n--------------PARKING ESPE--------------------")
    print("Cliente:",nombre)
    print("Hora de Entrada:",horaE,":",minutoE)
    print("Hora de Salida",horaS,":",minutoS)
    print("Valor a pagar $",parking_bill(horaE,minutoE,horaS,minutoS))
    print("Acérquese al punto de cobro más cercano")
    print("Que tenga un buen día :)")
    print("----------------------------------------------")  
    horaX_ = lambda n:horaX
    #Se mide la complejidad del algoritmo Parity Degree
    best, others= big_o.big_o(sistema_parking,horaX_)
    print("------------------------")
    #se imprime la complejidad Big O
    print("Big O =",best)
    print("------------------------")   