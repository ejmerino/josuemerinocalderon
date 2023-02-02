import big_o
def validar_numeros_enteros():
    '''
    Funcion donde se valida si es que el numero ingresado por el usuario es entero, si lo que se ingresó no es un numero
    entero entonces el usuario tendra que volver a ingresar un numero
    Parametros:
    ------------
        Esta funcion no tiene parametros
    Retorna:
    ------------
        numero : int
    '''
    #mientras sea verdadero se ingresara un dato en la variable numero, si lo que se ingreso es un numero entero
    #rompera el ciclo repetitivo while sino el usuario debera volver a ingresar un dato hasta que sea valido
    while True:
        try:
            numero=int(input())
            #rempemos ciclo repetitivo
            break
        except ValueError:
            print("No ha ingresado un numero entero,ingrese de nuevo:",end="")
    return numero

def leer_variable():
    '''
    Funcion que lee n variables
    Parametros:
    ------------
        Esta funcion no tiene parametros
    Retorna:
    ------------
        hora : str
    '''
    #ingreso la hora de entrada y la hora de salida
    
    print("Ingrese HH(numeros entre 0-23):",end="")
    hora=validar_numeros_enteros()
    #valido valores de 0 a 23
    while(hora<0 or hora>23):
        print("Ingrese numeros dentro del rango: ",end="")
        hora=validar_numeros_enteros()
    print("Ingrese MM(numeros entre 0-59):",end="")
    minuto=validar_numeros_enteros()
    #valido valores de 0 a 59
    while(minuto<0 or minuto>59):
        print("Ingrese numeros dentro del rango: ",end="")
        minuto=validar_numeros_enteros()
    #retorno la hora y minuto
    return hora,minuto
def factura_de_estacionamiento(horaEntrada,minutoEntrada,horaSalida,minutoSalida):
    '''
    Funcion que calcula la factura del estacionamiento segun la hora de entrada y salida

    Parametros:
    ------------
        horaEntrada : int
        minutoEntrada :int
        horaSalida : int
        minutoSalida : int
    Retorna:
    ------------
        factura : int
    '''
    #un contador para sebr el numero de horas que hay que cobrar
    contador=0
    #damos valor en dolares a las siguientes variables
    factura=0
    entrarEstacionamiento=2
    primeraHora=3
    #mientras la hora de entrada 
    while(horaEntrada!=horaSalida):
        horaEntrada=horaEntrada+1
        contador=contador+1
        #si la hora de entrada llega a ser 24 la cambio a cero para poder seguir sumando y salir del ciclo repetitivo
        if(horaEntrada==24):
            horaEntrada=0
    #calculamos el valor de la factura
    if(minutoSalida != 0 ):
        contador=contador+1
    if(contador==1):
        factura=primeraHora+entrarEstacionamiento
    if(contador>=2):
        factura=entrarEstacionamiento+primeraHora+((contador-1)*4)
    #retornamos el valor de la factura a pagar
    return factura
if __name__ == '__main__':
    #leo la hora de entrada y la hora de salida
    print("Ingrese la hora de entrada (HH:MM):")
    horaEntrada,minutoEntrada=leer_variable()
    print("Ingrese la hora de salida (HH:MM):")
    horaSalida,minutoSalida=leer_variable()
    print("HORA DE ENTRADA: ",horaEntrada,":",minutoEntrada)
    print("HORA DE SALIDA: ",horaSalida,":",minutoSalida)
    print("Factura del estacionamiento: $",factura_de_estacionamiento(horaEntrada,minutoEntrada,horaSalida,minutoSalida))