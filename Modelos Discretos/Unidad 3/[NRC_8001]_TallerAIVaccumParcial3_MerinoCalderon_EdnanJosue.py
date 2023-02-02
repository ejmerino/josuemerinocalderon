"""
Autor: Ednan Josué Merino Calderón
Versión: 1.1
"""
# INSTRUCTIONS
#Enter LOCATION A/B in captial letters
#Enter Status O/1 accordingly where 0 means CLEAN and 1 means DIRTY

def aspiradora_inteligente():
    # initializing meta
    # 0 indicates Clean and 1 indicates Dirty
    """Es un procedimento para emular el funcionamiento de una aspiradora
    Parametros:
    ------------
    no tiene paramentros de entrada 

    Retorna:
    ------------
    No retorna nigun valor 

    ---
     """
     #Declara variable objetivo 
    meta = {'A': '0', 'B': '0'}
    #Incializa una variable en este caso costo (costo) en 0
    costo = 0
    #user_input El usuario la localizacion inicial de la aspiradora
    entrada_habitacion = input("Ingrese la locación de la aspiradora: ") 
    #user_input El usuario señala SI la localizacion esta sucia o limpia
    estado_de_limpieza = input("Ingrese el estado de limpieza: " ) 
    #El usuario indicia el estado de la siguiente localizacion
    estado_hab_complementaria = input("Ingrese el estado de la otra habitación: ")
    print("Meta Esperada:" + str(meta))

#Agregar las condiciones
    if entrada_habitacion == 'A':
        # Localizacion A esta sucia.
        print("La Aspiradora está en la habitación A: ")
        if estado_de_limpieza == '1':
            print("La Habitación A está sucia")
            # Absorver la suciedad y marca el lugar como limpio
            meta['A'] = '0'
            costo += 1
            ## Incrementa el costoo de A
            print("Limpiando Habitación A")
            print("Costo Actual: " + str(costo))
#Condiciones para A limpio 
            if estado_hab_complementaria == '1':
                # SI B esta sucio
                print("Habitación B está sucia")
                print("Moviendo hacia la Habitación B ")
                costo += 1 #incrementar costo para moverse a la otra ubicacion
                print("Costo Actual: " + str(costo))
                # Limpiar y marcarlo como limpio
                meta['B'] = '0'
                costo += 1 #incrementar costo por limpieza 
                print("Limpiando Habitación B")
                print("Costo Actual: " + str(costo))
            elif estado_hab_complementaria == '0':
                # limpiar y marcar como limpio
                print("Habitación B ya está limpia")
                print("Sin Acción. Costo Actual:" + str(costo))
            else: 
                print("Ingrese un estado de limpieza correcto!")

               
        if estado_de_limpieza == '0':
            print("Habitación A ya está limpia")
            if estado_hab_complementaria == '1':
                # Si B esta Sucio
                print("Habitación B está sucia")
                print("Moviendo hacia la habitación B")
                costo += 1 #incrementar costo para moverse la locacion 
                print("Costo Actual: " + str(costo))
                # limpiar la suciedad y marcar como limpio
                meta['B'] = '0'
                costo += 1   
                print("Limpiando habitación B... ")                    #costo para limpiar
                print("Costo actualizado: "+str(costo))
                
            elif estado_de_limpieza == '1':
                print("Sin Acción" + str(costo))
                print(costo)
                # aspirar y marcar como limpio
                print("Habitación B está limpia")
            else:
                print("Ingrese un estado de limpieza correcto!")

    elif entrada_habitacion == 'B':
        print("La aspiradora se enceuntra en la habitación B")
        # Localizacion B esta sucia.
        if estado_de_limpieza == '1':
            print("Habitación B está sucia")
            # Aspirar la suciedad y marcarla como limpia
            meta['B'] = '0'
            costo += 1  # costo para aspirar
            print("Costo por limpiar " + str(costo))
            print("La habitación B ha sido limpiada")

            if estado_hab_complementaria == '1':
                # Si A esta Sucio
                print("Location A está sucia")
                print("Moviendose hacia la habitación A ")
                costo += 1  # costo Para moverse a la localizacion
                print("Costo por moverse" + str(costo))
                # Aspirar la suciedad y marcarla como limpia
                meta['A'] = '0'
                costo += 1  # costo para aspirar 
                print("Costo por aspirar " + str(costo))
                print("Habitación A ha sido limpiada")
            #si a no está sucio
            elif estado_hab_complementaria=='0':
                print("Sin Acción" + str(costo))
                print(costo)
                # aspirar y marcar como limpio
                print("Habitación A está limpia")
            #Si no ingresó un dato correcto
            else:
                print("Ingrese un dato válido")

        else:
            print(costo)
            # aspirar and marcar como limpio
            print("Habitación B ya está limpia")

            if estado_hab_complementaria == '1': 
                 # Si A esta sucio
                print("Habitación A está sucia")
                print("Moviendose hacia la habitación A ")
                costo += 1  
                # costo para moverse a la izquierda
                print("Costo por moverse " + str(costo))
                # Limpiar la suciedad y marcar como limpio
                meta['A'] = '0'
                costo += 1 
                 # costo para limpiar
                print("Costo por limpiar " + str(costo))
                print("Habitación A ha sido limpiada")
            elif estado_hab_complementaria=='0':
                print("Sin Acción" + str(costo))
                # limpiar y marcar como limpio
                print("Habitación A ya estaba limpia")
            #Si ingresa un valor que no existe
            else:
                print("Ingrese un dato válido")
    else:
        print("Ingrese una habitación correcta")
        aspiradora_inteligente()

    # Terminar Limpieza 
    print("Meta: ")
    #Se imprime la meta
    print(meta)
    #Se imprime la medida de rendimiento
    print("Medida de rendimiento: " + str(costo))

if __name__=='__main__':
    """
    Función que recorre el aplicativo
    """
    #Se llama a la función principal
    aspiradora_inteligente()