"""
Utilizando el PEAS adjunto usted debe programar las reglas para programar el agente inteligente.

Autor: Ednan Josué Merino Calderón
Versión: 1.0
"""

def control_trafico():
    """
    Función que controla si el usuario puede dirigirse desde la carretera donde se encuentra hacia la carretera deseada
    Se toma en cuenta el estado del tráfico (Si está libre o cerrado)
    -----------------------------------
    Parámetros:
    No tiene parámetros
    Retorna:
    No retorna
    """
    #Se inicializa el costo en 0
    costo=0    
    #Se le pide al usuario que ingrese la carretera en donde se encuentra
    ingreso_carretera= input("Ingrese la carretera donde se encuentra: ")
    #Se le pide al usuario que ingrese la carretera hacia donde quiere avanzar          
    carretera_deseada= input("Ingrese la vía a la que desea ir:")
    #Se le pide al usuario que ingrese el estado del tráfico según sea requerido
    estado_trafico=input("Ingrese el estádo del Tráfico [0:Vía Libre] [1:Vía Cerrada]:")
    #Si el usuario ingresó que se encuentra en Quito
    if ingreso_carretera=='Q':
        #Además quiere ir a Chone
        if carretera_deseada=='C':
            #Se le notifica al usuario la decisión que tomó
            print("Está en la carretera QUITO y quiere ir a CHONE")
            #Si la vía a Chone está libre
            if estado_trafico=='0':
                #Se le notifica al usuario que es posible que transite
                print("Es posible que transites a la carretera CHONE")
                #Se le informa la distancia al usuario
                print("Se encuentra a 311 km de CHONE")
                #Se imprime el costo             
                print("El costo es " + str(costo))
            #Si la vía a chone está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible
                print("No es posible, vía a Chone cerrada")
                #El costo incrementa en 1
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le comunica al usuario que ingresó un dato incorrecto
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario a intentarlo de nuevo
                print("Inténtelo de nuevo!\n")
                #Se imprime la función menú
                menu()
                #Se vuelva a ejecutar la función que controla el tráfico
                control_trafico()
        #El usuario desea ir a Lorena
        elif carretera_deseada=='L':
            #Se le notifica al usuario al decisión que tomó.
            print("Está en la carretera QUITO y quiere ir a LORENA")
            #Si la vía está libre
            if estado_trafico=='0':
                #Se le informa al usuario que es posible que transite a la carretera seleccionada
                print("Es posible que transites a la carretera LORENA")
                #Se le informa la distancia al usuario
                print("Se encuentra a 152 km de LORENA")
                #Se imprime el costo                      
                print("El costo es " + str(costo))
            #Si la vía está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible circular
                print("No es posible, vía cerrada")
                #Se aumenta en uno el costo
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario no ingresó un dato de tráfico válido
            else:
                #Se le informa al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se le pide al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función que controla el tráfico
                control_trafico()
        
        #Si el usuario desea ir a PILATÓN
        elif carretera_deseada=='P':
            #Se imprime la decisión del usuario
            print("Está en la carretera QUITO y quiere ir a PILATON")
            #Si la carretera está libre
            if estado_trafico=='0':
                #Se imprime que es posible transitar
                print("Es posible que transites a la carretera PILATON")
                #Se le informa la distancia al usuario
                print("Se encuentra a 121 km de PILATON")
                #Se imprime el costo                       
                print("El costo es " + str(costo))
            #Si la carretera está cerrada
            elif estado_trafico=='1':
                #Se le noticia al usuario
                print("No es posible, vía cerrada")
                #Se asciende el costo en uno
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le notifica al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función control_tráfico
                control_trafico()    
        #Si el usuario no ingresó una carretera válida  
        else:
            #Se le notifica al usuario
            print("Ingrese una carretera a donde desee ir válida")
            #Se alienta al usuario que lo intente de nuevo
            print("Inténtelo de nuevo!\n")
            #Se corre la función menú
            menu()
            #Se corre la función control_tráfico
            control_trafico()      
    
    #Si el usuario se encuentra en Chone
    elif ingreso_carretera=='C':
        #Además quiere ir a Quito
        if carretera_deseada=='Q':
            #Se le notifica al usuario la decisión que tomó
            print("Está en la carretera CHONE y quiere ir a QUITO")
            #Si la vía a Quito está libre
            if estado_trafico=='0':
                #Se le notifica al usuario que es posible que transite
                print("Es posible que transites a la carretera QUITO")
                #Se le informa la distancia al usuario
                print("Se encuentra a 311 km de QUITO")
                #Se imprime el costo             
                print("El costo es " + str(costo))
            #Si la vía a Quito está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible
                print("No es posible, vía a QUITO cerrada")
                #El costo incrementa en 1
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le comunica al usuario que ingresó un dato incorrecto
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario a intentarlo de nuevo
                print("Inténtelo de nuevo!\n")
                #Se imprime la función menú
                menu()
                #Se vuelva a ejecutar la función que controla el tráfico
                control_trafico()
        #El usuario desea ir a Lorena
        elif carretera_deseada=='L':
            #Se le notifica al usuario al decisión que tomó.
            print("Está en la carretera CHONE y quiere ir a LORENA")
            #Si la vía está libre
            if estado_trafico=='0':
                #Se le informa al usuario que es posible que transite a la carretera seleccionada
                print("Es posible que transites a la carretera LORENA")
                #Se le informa la distancia al usuario
                print("Se encuentra a 159 km de LORENA")
                #Se imprime el costo                      
                print("El costo es " + str(costo))
            #Si la vía está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible circular
                print("No es posible, vía cerrada")
                #Se aumenta en uno el costo
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario no ingresó un dato de tráfico válido
            else:
                #Se le informa al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se le pide al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función que controla el tráfico
                control_trafico()
        
        #Si el usuario desea ir a PILATÓN
        elif carretera_deseada=='P':
            #Se imprime la decisión del usuario
            print("Está en la carretera CHONE y quiere ir a PILATON")
            #Si la carretera está libre
            if estado_trafico=='0':
                #Se imprime que es posible transitar
                print("Es posible que transites a la carretera PILATON")
                #Se le informa la distancia al usuario
                print("Se encuentra a 191 km de PILATON")
                #Se imprime el costo                       
                print("El costo es " + str(costo))
            #Si la carretera está cerrada
            elif estado_trafico=='1':
                #Se le noticia al usuario
                print("No es posible, vía cerrada")
                #Se asciende el costo en uno
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le notifica al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función control_tráfico
                control_trafico()    
        #Si el usuario no ingresó una carretera válida  
        else:
            #Se le notifica al usuario
            print("Ingrese una carretera a donde desee ir válida")
            #Se alienta al usuario que lo intente de nuevo
            print("Inténtelo de nuevo!\n")
            #Se corre la función menú
            menu()
            #Se corre la función control_tráfico
            control_trafico()      
    
    elif ingreso_carretera=='P':
        #Además quiere ir a Chone
        if carretera_deseada=='C':
            #Se le notifica al usuario la decisión que tomó
            print("Está en la carretera PILATON y quiere ir a CHONE")
            #Si la vía a Chone está libre
            if estado_trafico=='0':
                #Se le notifica al usuario que es posible que transite
                print("Es posible que transites a la carretera CHONE")
                #Se le informa la distancia al usuario
                print("Se encuentra a 191 km de PILATON")
                #Se imprime el costo             
                print("El costo es " + str(costo))
            #Si la vía a chone está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible
                print("No es posible, vía a Chone cerrada")
                #El costo incrementa en 1
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le comunica al usuario que ingresó un dato incorrecto
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario a intentarlo de nuevo
                print("Inténtelo de nuevo!\n")
                #Se imprime la función menú
                menu()
                #Se vuelva a ejecutar la función que controla el tráfico
                control_trafico()
        #El usuario desea ir a Lorena
        elif carretera_deseada=='L':
            #Se le notifica al usuario al decisión que tomó.
            print("Está en la carretera PILATON y quiere ir a LORENA")
            #Si la vía está libre
            if estado_trafico=='0':
                #Se le informa al usuario que es posible que transite a la carretera seleccionada
                print("Es posible que transites a la carretera LORENA")
                #Se le informa la distancia al usuario
                print("Se encuentra a 31 km de LORENA")
                #Se imprime el costo                      
                print("El costo es " + str(costo))
            #Si la vía está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible circular
                print("No es posible, vía cerrada")
                #Se aumenta en uno el costo
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario no ingresó un dato de tráfico válido
            else:
                #Se le informa al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se le pide al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función que controla el tráfico
                control_trafico()
        
        #Si el usuario desea ir a QUITO
        elif carretera_deseada=='Q':
            #Se imprime la decisión del usuario
            print("Está en la carretera PILATON y quiere ir a QUITO")
            #Si la carretera está libre
            if estado_trafico=='0':
                #Se imprime que es posible transitar
                print("Es posible que transites a la carretera QUITO")
                #Se le informa la distancia al usuario
                print("Se encuentra a 119 km de QUITO")
                #Se imprime el costo                       
                print("El costo es " + str(costo))
            #Si la carretera está cerrada
            elif estado_trafico=='1':
                #Se le noticia al usuario
                print("No es posible, vía cerrada")
                #Se asciende el costo en uno
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le notifica al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función control_tráfico
                control_trafico()    
        #Si el usuario no ingresó una carretera válida  
        else:
            #Se le notifica al usuario
            print("Ingrese una carretera a donde desee ir válida")
            #Se alienta al usuario que lo intente de nuevo
            print("Inténtelo de nuevo!\n")
            #Se corre la función menú
            menu()
            #Se corre la función control_tráfico
            control_trafico()      
    
    elif ingreso_carretera=='L':
        #Además quiere ir a Chone
        if carretera_deseada=='C':
            #Se le notifica al usuario la decisión que tomó
            print("Está en la carretera LORENA y quiere ir a CHONE")
            #Si la vía a Chone está libre
            if estado_trafico=='0':
                #Se le notifica al usuario que es posible que transite
                print("Es posible que transites a la carretera CHONE")
                #Se imprime el costo             
                print("El costo es " + str(costo))
            #Si la vía a chone está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible
                print("No es posible, vía a Chone cerrada")
                #El costo incrementa en 1
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le comunica al usuario que ingresó un dato incorrecto
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario a intentarlo de nuevo
                print("Inténtelo de nuevo!\n")
                #Se imprime la función menú
                menu()
                #Se vuelva a ejecutar la función que controla el tráfico
                control_trafico()
        #El usuario desea ir a Lorena
        elif carretera_deseada=='Q':
            #Se le notifica al usuario al decisión que tomó.
            print("Está en la carretera LORENA y quiere ir a QUITO")
            #Si la vía está libre
            if estado_trafico=='0':
                #Se le informa al usuario que es posible que transite a la carretera seleccionada
                print("Es posible que transites a la carretera QUITO")
                #Se imprime el costo                      
                print("El costo es " + str(costo))
            #Si la vía está cerrada
            elif estado_trafico=='1':
                #Se le notifica al usuario que no es posible circular
                print("No es posible, vía cerrada")
                #Se aumenta en uno el costo
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario no ingresó un dato de tráfico válido
            else:
                #Se le informa al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se le pide al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función que controla el tráfico
                control_trafico()
        
        #Si el usuario desea ir a PILATÓN
        elif carretera_deseada=='P':
            #Se imprime la decisión del usuario
            print("Está en la carretera LORENA y quiere ir a PILATON")
            #Si la carretera está libre
            if estado_trafico=='0':
                #Se imprime que es posible transitar
                print("Es posible que transites a la carretera PILATON")
                #Se imprime el costo                       
                print("El costo es " + str(costo))
            #Si la carretera está cerrada
            elif estado_trafico=='1':
                #Se le noticia al usuario
                print("No es posible, vía cerrada")
                #Se asciende el costo en uno
                costo += 1 
                #Se imprime el costo
                print("El costo es "+str(costo))
            #Si el usuario ingresó un dato inválido
            else:
                #Se le notifica al usuario
                print("Usted ingresó un dato de tráfico inválido")
                #Se alienta al usuario que lo intente de nuevo
                print("Inténtelo de nuevo!\n")
                #Se corre la función menú
                menu()
                #Se corre la función control_tráfico
                control_trafico()    
        #Si el usuario no ingresó una carretera válida  
        else:
            #Se le notifica al usuario
            print("Ingrese una carretera a donde desee ir válida")
            #Se alienta al usuario que lo intente de nuevo
            print("Inténtelo de nuevo!\n")
            #Se corre la función menú
            menu()
            #Se corre la función control_tráfico
            control_trafico()      
    else:
        #Se le notifica al usuario
        print("Ingrese una carretera válida!")
        #Se alienta al usuario que lo intente de nuevo
        print("Inténtelo de nuevo!\n")
        #Se corre la función menú
        menu()
        #Se corre la función control_tráfico
        control_trafico()      

def menu():
    """
    Función para elegir la carretera que desea el usuario
    -----------------------------------------------------
    Parámetros:
    No tiene parámetros
    -----------------------------------------------------
    Retorna:
    No retorna nada
    """
    print("Carreteras:\n")
    print("1.- Para Quito, escriba la Letra Q")
    print("2.- Para Lorena, escriba la Letra L")
    print("3.- Para Pilatón, escriba la Letra P")
    print("4.- Para Chone, escriba la Letra C\n")

if __name__=='__main__':
    #Se corre la función que ejecuta el menú
    menu()
    #Se corre la función que controla el tráfico
    control_trafico()
