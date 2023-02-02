import big_o
def leer_variable():
    '''
    Funcion que lee n variables
    Parametros:
    ------------
        Esta funcion no tiene parametros
    Retorna:
    ------------
        s : str
    '''
    #ingreso una cadena
    s=input("Ingrese una cadena:")
    return s

def encontrar_indice(s):
    '''
    Funcion que toma la cadena "s" la cual va a recorrer la todas las letras(caracteres) de la cadena invertida a la derecha
    
    Parametros:
    ------------
        s : str
    Retorna:
    ------------
        i : int
        valor de -1 en caso de que el tamño de la lista sea cero
    '''
    
    # Si el tamaño de la cadena es cero entonces retorno -
    if len(s) == 0:
        return -1

    #recorre cada carácter de la cadena Cada vez que el ciclo se repite, se actualiza la variable i con el índice del carácter actual, que luego se utiliza en 
    #la línea del if para obtener las subcadenas a la izquierda y derecha del carácter actual.
    for i in range(len(s)):
        #primer operador de slicing que devuelve la subcadena que va desde el índice 0 hasta el índice i-1.
        if s[:i] == s[i+1:][::-1] or s[i:] == s[:i][::-1]:
            return i
    return -1

if __name__ == '__main__':
    #leo variables
    s=leer_variable()
    #imprimo el valor de la funcion
    print(encontrar_indice(s))

    print("BIG_O:")
    positive_int_generator = lambda n: s
    best, others= big_o.big_o(encontrar_indice,positive_int_generator)
    print(best)