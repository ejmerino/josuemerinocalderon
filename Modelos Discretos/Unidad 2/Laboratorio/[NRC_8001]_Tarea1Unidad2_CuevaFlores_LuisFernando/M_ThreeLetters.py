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
        A : int
        B : int
    '''
    #ingreso los enteros A y B
    
    print("Ingrese el valor de A(1-100):",end="")
    A=validar_numeros_enteros()
    #validamos que ingrese numeros entre 1 y 100
    while(A<1 or A>100):
        A=validar_numeros_enteros()
    
    print("Ingrese el valor de B(1-100):",end="")
    B=validar_numeros_enteros()
    #validamos que ingrese numeros entre 1 y 100
    while(B<1 or B>100):
        B=validar_numeros_enteros()
    #retorno A,B
    return A,B

def generar_cadena(A, B):
    '''
    Funcion que me retorna la cadena generada que contenga exactamente A letras 'a' y 
    exactamente B letras 'b' sin tres letras consecutivas iguales

    Parametros:
    ------------
        A : int
        B : int
    Retorna:
    ------------
        s : str
    '''
    s = ''
    while A > 0 or B > 0:
        
        if s[-2:] != 'aa' and A > 0:
            s += 'a'
            A -= 1
        if s[-2:] != 'bb' and B > 0:
            s += 'b'
            B -= 1
        if A > 0:
            s += 'a'
            A -= 1
        if B > 0:
            s += 'b'
            B -= 1
    return s

if __name__ == '__main__':
    #leo los enteros a y b
    A,B=leer_variable()
    #en la variablecadena genero las letras que me genera en la funcion generar cadena
    cadena=generar_cadena(A,B)
    #imprimo la cadena
    print(cadena)
    print("''''''''''''''''''")
    print("BIG_O:")
    positive_int_generator = lambda n,m: (A,B)
    best, others= big_o.big_o(generar_cadena,positive_int_generator,inputs=[A,B])
    print(best)