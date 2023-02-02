#INSTRUCTIONS
#Enter LOCATION A/B in captial letters
#Enter Status O/1 accordingly where 0 means CLEAN and 1 means DIRTY

def Aspiradora():
    # initializing goal_state
    # 0 indicates Clean and 1 indicates Dirty
    """
    Es un procedimiento para emular el funcionamiento de una aspiradora
    Paramteros:
    -----------------
    No tiene parametros de entrada

    Retorna
    -----------------
    No retorna ningun valor
    """
    #Declara variable objetivo
    goal_state = {'A': '0', 'B': '0'}
    #Inicializa variable "cost" en 0
    cost = 0
    #User input of location vacuum is placed
    location_input = input("Enter Location of Vacuum: ") 
    #user_input if location is dirty or clean
    status_input = input("Enter status of: " + location_input) 
    #user_input status of other room
    status_input_complement = input("Enter status of other room: ")
    #imprime la meta deseada
    print("Desired Goal:" + str(goal_state))
    #if llama a la clase "Aspiradora"
    if __name__=='__main__':
        Aspiradora()
    #Por si el usuario escoge la localización A
    if location_input == 'A':
        # Location A is Dirty.
        print("Vacuum is placed in Location A: ")
        #Por si el usuario escoge "1"
        if status_input == '1':
            #Imprime que la locación está sucia
            print("Location A is Dirty.")
            # suck the dirt  and mark it as clean
            goal_state['A'] = '0'
            ## increasing cost for cleaning A
            cost += 1
            #imprime que se está limpiando la locación A
            print("Cleaning location A")
            #Imprime el precio actual
            print("Current Cost: " + str(cost))
            #Por si el usuario seleccióna "1"
            if status_input_complement == '1':
                # if B is Dirty
                print("Location B is Dirty.")
                #Imprime que la aspiradora se está moviendo hacia la locación B
                print("Moving right to the Location B. ")
                cost += 1 #increasing cost for moving right
                print("Current cost: " + str(cost))
                # suck the dirt and mark it as clean
                goal_state['B'] = '0'
                #increasing cost for cleaning
                cost += 1 
                #Imprime que está limpiando la locacion B
                print("Cleaning location B")
                #Imprime el precio actual
                print("Current cost: " + str(cost))
            else:
                # suck and mark clean
                print("Location B is already clean.")
                #Imprime que no tiene acción y el precio actual
                print("No action. Current cost" + str(cost))
        #Si el usuario digita la opción 0
        if status_input == '0':
            #Imprime que la locación A está limpia todavía
            print("Location A is already clean.")
            # if B is Dirty
            if status_input_complement == '1':
                #Imprime que la locación B está sucia
                print("Location B is Dirty.")
                #Imprime que se está moviendo derecho por la locación B
                print("Moving RIGHT to the Location B.")
                #increasing cost for moving right
                cost += 1 
                #Imprime el costo actual
                print("Current cost: " + str(cost))
                # suck the dirt and mark it as clean
                goal_state['B'] = '0'
                cost += 1   
                #Limpia que se está limpiando la locación B
                print("Cleaning location B. ")
                #cost for suck                    
                print("Updated cost: "+str(cost))
            #Por si no se seleccionó la opción 0
            else:
                #Imprime que la aspiradora no hará ninguna acción
                print("No action " + str(cost))
                #Imprime el costo
                print(cost)
                # suck and mark clean
                print("Location B is already clean.")

    else:
        #Por si la aspiradora está en la locación B
        print("Vacuum is placed in location B")
        # Location B is Dirty.
        if status_input == '1':
            #Imprime que la locación B está sucia
            print("Location B is Dirty.")
            # suck the dirt  and mark it as clean
            goal_state['B'] = '0'
            # cost for suck
            cost += 1  
            #Imprime el costo de limpieza
            print("COST for CLEANING " + str(cost))
            #Imprime que la locación B ya está limía
            print("Location B has been Cleaned.")
            # if A is Dirty
            if status_input_complement == '1':
                #Imprime que la locación A está sucia
                print("Location A is Dirty.")
                #Imprime que se mueve a la izquierda de la locación A
                print("Moving LEFT to the Location A. ")
                cost += 1  
                # cost for moving right
                print("COST for moving LEFT" + str(cost))
                # suck the dirt and mark it as clean
                goal_state['A'] = '0'
                cost += 1  
                # cost for suck
                print("COST for SUCK " + str(cost))
                # Imprime que la locación A ha sido limpiada
                print("Location A has been Cleaned.")

        else:
            # suck and mark clean
            print(cost)
            #Imprime que la locación B ya está limía
            print("Location B is already clean.")
            # if A is Dirty
            if status_input_complement == '1':  
                #Imprime que la locación A está sucia
                print("Location A is Dirty.")
                #Se mueve a la izquierda de la locación A
                print("Moving LEFT to the Location A. ")
                cost += 1  
                # cost for moving right
                print("COST for moving LEFT " + str(cost))
                # suck the dirt and mark it as clean
                goal_state['A'] = '0'
                cost += 1  
                # cost for suck
                print("Cost for SUCK " + str(cost))
                #Imprime que la locación A ha sido limpiada
                print("Location A has been Cleaned. ")
            else:
                #Imprime que la aspiradora no hará ninguna acción
                print("No action " + str(cost))
                # suck and mark clean
                print("Location A is already clean.")

    # done cleaning
    print("GOAL STATE: ")
    print(goal_state)
    #Se imprime el performance measurement
    print("Performance Measurement: " + str(cost))


Aspiradora()