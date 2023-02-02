"""
Dada una cadena de tamaño n, escriba un programa para realizar las siguientes operaciones en la cadena:

•	Gire a la izquierda (o en sentido contrario a las agujas del reloj) la cadena dada por d elementos (donde d <= n).
•	Gire a la derecha (o en el sentido de las agujas del reloj) gire la cadena dada por d elementos (donde d <= n).

Autor: Ednan Josué Merino Calderón
"""
import big_o

def rotate(cadena,dim): 
    """
    Función que rota a favor o en contra las manecillas del reloj una cadena de caracteres

    Args:
        cadena (str): Cadena de caracteres a ser manipulada
        dim (int): Número de letras necesario para girar
    Retorna:
        Cadena girada a favor de las manecillas del reloj
        Cadena girada en contra de las manecillas del reloj
    """
 
    #Divido las cadenas según el grio al que quiera adoptarme
    #Cadena contrario a las manecillas del reloj
    GiroIzq1 = cadena[0:dim] 
    #Cadena a favor de las manecillas del reloj
    GiroDer1 = cadena[dim:] 
    #Creo la nueva cadena contraria a las manecillas del reloj
    GiroIzq2 = cadena[0:len(cadena)-dim] 
    #Creo la nueva cadena a favor de las manecillas del reloj
    GiroDer2 = cadena[len(cadena)-dim:] 
    #Imprimo para Giro Contrario a las manecillas del Reloj concatenando las cadenas anteriormente desarrolladas
    print ("Giro Contrario a las manecillas del Reloj: ", (GiroDer1 + GiroIzq1) )
    #Imprimo para Giro a favor de las manecillas del Reloj concatenando las cadenas anteriormente desarrolladas
    print ("Giro en Sentido a las manecillas del Reloj: ", (GiroDer2 + GiroIzq2)) 
 
if __name__ == "__main__":
    """
    Función que hace funcionar al aplicativo
    """
    #Pido que el usuario ingrese una cadena por teclado
    cadena = str(input("Ingrese una cadena:"))
    cad = cadena
    #Bucle para validar datos
    while True:
        #Validación de datos tipo int
        try:
        #Pido al usuario un valor de número de letras nesarias para girar
            d = int(input("Ingrese la numero de letras necesarias para girar:"))
            #break
            break
        #Si el usuario no ingresó el tipo de dato requerido
        except ValueError:
            #Se le informa de su error
            print("Ingresó un valor erroneo!")
    #Si el número de letras necesario para girar en menor que cero o igual a la longitud de la cadena
    if d < 0 or d == len(cadena):
        #Se le notifica al usuario que no puede girarse
        print("No puede girarse")
    #Caso contrario
    else:        
        #Se llama a la función y se le envía los parámetros
        rotate(cadena,d)
    
    """
    CODIGO DE BIG O
    aux_big_o = lambda n: cad
    best, others= big_o.big_o(rotate(),aux_big_o)
    print("---------------------")
    print("BIG O:",best)
    """