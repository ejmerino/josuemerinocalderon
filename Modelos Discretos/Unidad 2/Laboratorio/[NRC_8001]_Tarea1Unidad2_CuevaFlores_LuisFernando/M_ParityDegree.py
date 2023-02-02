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
        N : int
    '''
    #ingreso la hora de entrada y la hora de salida
    
    print("Ingrese el valor de N:",end="")
    N=validar_numeros_enteros()
    #validamos que ingrese numeros entre 1 y 1000000000
    while(N<=0 or N>1000000000):
        N=validar_numeros_enteros()
    #retorno N
    return N
    
def mayor_potencia_de_dos(N): 
    '''
    Funcion que calcula la mayor potencia de dos
    Parametros:
    ------------
        Esta funcion no tiene parametros
    Retorna:
    ------------
        N : int
    '''
    #declaro el resultado a cero que se usado como un contador
    resultado = 0
    #mientras el residuo entre N/2 sea igual a cero aumentamos resultado +1
    
    while (N % 2 == 0): 
        resultado+=1
        #divide al primer número por el segundo número y redondea hacia abajo el resultado al entero más cercano.
        N = N//2
    #retornamos el resultado
    return resultado

if __name__ == '__main__':
    #Leo la variable N
    N=leer_variable()
    #imprimo la mayor potencia de dos
    print(mayor_potencia_de_dos(N))

    print("BIG_O:")
    positive_int_generator = lambda n: N
    best, others= big_o.big_o(mayor_potencia_de_dos,positive_int_generator)
    print(best)