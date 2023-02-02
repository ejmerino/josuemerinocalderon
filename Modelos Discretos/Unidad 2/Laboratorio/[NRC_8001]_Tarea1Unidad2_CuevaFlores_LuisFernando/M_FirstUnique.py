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
def leer_variables():
    '''
    Funcion que lee n variables
    Parametros:
    ------------
        Esta funcion no tiene parametros
    Retorna:
    ------------
        tamaño_lista : int
    '''
    #Ingreso el tamaño de la lista el cual puede ser entre 1 y 100000
    print("Ingrese el tamaño de la lista (1 - 100 000): ",end="")
    #valido los numeros enteros
    tamaño_lista=validar_numeros_enteros()
    #valido los numeros fuera de rango entre 1 y 100000
    while(tamaño_lista<1 or tamaño_lista>100000):
        print("Ingrese un numero dentro del rango (1 - 100 000)",end="")
        tamaño_lista=validar_numeros_enteros()
    #retorno lista
    return tamaño_lista

def llenar_lista(lista_numeros,tamaño_lista):
    '''
    Funcion que llena una lista con numeros  comprendidos entre 1 y 1000000000 

    Parametros:
    ------------
        lista_numeros : lista
        tamaño_lista : int
    Retorna:
    ------------
        Esta funcion no retorna ningun tipo de dato

    '''
    #for que llena una lista con numeros  entre 1 y 1000000000 
    for i in range(tamaño_lista):
        print("Ingrese un numero entre (1 - 100 000): ",end="")
        numero=validar_numeros_enteros()
        lista_numeros.append(numero)
def imprimir_numeros_de_la_lista(lista_numeros):
    print(lista_numeros)
    
def primer_numero_en_no_repetirse(lista_numeros):
    #creamos un diccionario llamado cntadores donde podremos guardar cualquier tipo de dato
    contadores = {}
    #recorriendo la lista
    for number in lista_numeros:
        # Si el número no está en el diccionario, lo agregamos y le asignamos un valor de 1
        if number not in contadores:
            contadores[number] = 1
        # Si el número ya está en el diccionario, aumentamos su valor en 1
        else:
            contadores[number] += 1
# Recorremos la lista de números aleatorios de nuevo
    for number in lista_numeros:
        # Si el número solo ha aparecido una vez, lo imprimimos y terminamos la ejecución del código
        if contadores[number] == 1:
            print("Primer numero sin repetir: ",number)
            break
    # Si llegamos al final de la lista sin haber encontrado un número que no se repita, imprimimos -1
    else:
        print("No hay numeros que no repitan")
        print(-1)


if __name__ == '__main__':
    lista_numeros=[]
    tamaño_lista=leer_variables()
    llenar_lista(lista_numeros,tamaño_lista)
    imprimir_numeros_de_la_lista(lista_numeros)
    primer_numero_en_no_repetirse(lista_numeros)
    print("BIG_O:")
    positive_int_generator = lambda n: lista_numeros
    best, others= big_o.big_o(primer_numero_en_no_repetirse,positive_int_generator)
    print(best)