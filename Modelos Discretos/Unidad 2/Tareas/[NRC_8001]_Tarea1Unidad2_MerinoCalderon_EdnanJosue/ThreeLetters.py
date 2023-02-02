"""
Write a function solution that, given two integers A and B, returns a string containing exactly A letters 'a' 
and exactly B letters 'b' with no three consecutive letters being the same (in other words, neither "aaa" nor "bbb" 
may occur in the returned string).

Autor: Josué Merino Calderón

Versión: 1.0
"""
import big_o

def entrada_de_datos():
    """
    Función que realiza las respectivas validaciones de los datos ingresados por el usuario, en este caso un entero
    -------------------------------------------------
    No hay parámetros
    -------------------------------------------------
    Retorna el dato de tipo entero
    """
    #Bucle para realizar la validación de datos
    while True:
        try:
            #El usuario ingresa un dato por teclado de tipo entero
            dato=int(input())
            #break
            break
        except ValueError:
            print("Ingrese un dato válido!")
            entrada_de_datos()
    return dato

def interprete_de_datos():
    """
    Funcion que lee n variables
    ---------------------------
    No tiene parámetros
    ---------------------------
    Retorna:
    A y B
    """
    #ingreso los enteros A y B
    
    print("Ingrese cuantas veces A:")
    A=entrada_de_datos()
    #El usuario ingresa un dato que no se encuentra dentro del intervalo [1,100]
    while(A<1 or A>100):
        #La variable A llama a la función entrada de datos
        A=entrada_de_datos()    
    print("Ingrese cuantas veces B:")
    B=entrada_de_datos()
   #El usuario ingresa un dato que no se encuentra dentro del intervalo [1,100]
    while(B<1 or B>100):
        #La variable B llama a la función entrada de datos
        B=entrada_de_datos()
    #retorna la variable
    return A, B

def Generador(A, B):
    """
    Funcion que retorna la cadena generada con las instrucciones previamente especificadas
    -----------------------------------------------------
    Parametros:
    A: Cuantas veces A
    B: Cuantas veces B
    -----------------------------------------------------
    Retorna:
    aux: cadena auxiliar 
    """
    #Se inicializa una variable auxiliar de tipo string que será nuestra cadena
    aux = ''
    #Bucle mientras A y B sean mayores que 0
    while A > 0 or B > 0:
            #Si no está 2 veces seguidas la cadena "aa" y A es mayor que 0
            if aux[-2:] != 'aa' and A > 0:
                #Se añade la letra a
                aux += 'a'
                #Disminuye en 1 el contador
                A -= 1
            #Si no está 2 veces seguidas la cadena "bb" y B es mayor que 0
            if aux[-2:] != 'bb' and B > 0:
                #Se añade la letra b
                aux += 'b'
                #Disminuye en 1 el contador
                B -= 1
            #Si A es mayor que 0
            if A > 0:
                #Se le concatena la letra a
                aux += 'a'
                #Disminuye en 1 el contador
                A -= 1
            #Si B es mayor que 0
            if B > 0:
                #Se le concatena la letra b
                aux += 'b'
                #Disminuye en 1 el contador
                B -= 1
    #Retorna la cadena auxiliar
    return aux

if __name__ == '__main__':
    #A y B leen los datos
    A,B=interprete_de_datos()
    #Se genera la cadena
    cadena=Generador(A,B)
    #Se imprime la cadena
    print("La cadena generada es:",cadena)
    #Almaceno en la variable str_cadena
    str_cadena_1 = lambda n:A
    #Algoritmo para calcular el tiempo de ejecución
    best, others= big_o.big_o(Generador,str_cadena_1)
    print("------------------------------")
    #Imprime el tiempo de ejecución
    print("Big O 1=", best)
    print("------------------------------")
    str_cadena_2 = lambda m:B
    #Algoritmo para calcular el tiempo de ejecución
    best_1, others= big_o.big_o(Generador,str_cadena_2)
    print("------------------------------")
    #Imprime el tiempo de ejecución
    print("Big O 1=", best_1)
    print("------------------------------")