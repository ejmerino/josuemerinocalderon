'''
Usted debe programar el algortimo de busqueda general adaptado a su problema del taller denominado "Taller 4 : Métodos de búsqueda".

Autor: Ednan Josué Merino Calderón

Versión: 1.1
'''

"""_busqueda_centro_historico_

	Args:
		goal (_type_): es una lista de nodos deseados
		start (_type_): es el nodo desde el que se iniciará la búsqueda.

	Returns:
		_type_: lista de costos mínimos desde el nodo de inicio hasta cada nodo en la lista de objetivos.
"""
def busqueda_centro_historico(goal, start):
    # Declaración de variables globales para el grafo y los costos
    global graph, cost
    
    # Lista para almacenar los costos mínimos
    answer = []
    # Cola para expandir los nodos
    queue = []
    # Inicialización de la lista de respuestas con un valor alto
    for i in range(len(goal)):
        answer.append(10**8)
    # Agregar el nodo de inicio a la cola con costo 0
    queue.append([0, start])
    # Diccionario para almacenar los nodos visitados
    visited = {}
    # Contador para verificar cuántos nodos objetivo se han encontrado
    count = 0
    # Mientras la cola no esté vacía
    while len(queue) > 0:
        # Ordenar la cola por costo
        queue = sorted(queue, key=lambda x: x[0])
        # Tomar el nodo con el costo mínimo
        p = queue.pop(0)
        # Si el nodo actual es un nodo objetivo
        if p[1] in goal:
            # Obtener el índice del nodo objetivo en la lista de objetivos
            index = goal.index(p[1])
            # Si aún no se ha encontrado un costo mínimo para este nodo objetivo
            if answer[index] == 10**8:
                # Incrementar el contador
                count += 1
            # Si el costo actual es menor que el costo mínimo previamente encontrado para este nodo objetivo
            if answer[index] > p[0]:
                # Actualizar el costo mínimo
                answer[index] = p[0]
            # Si se han encontrado costos mínimos para todos los nodos objetivo
            if count == len(goal):
                # Devolver la lista de costos mínimos
                return answer
        # Si el nodo actual aún no ha sido visitado
        if p[1] not in visited:
            # Expandir sus vecinos
            for i in graph[p[1]]:
                queue.append([p[0] + cost[(p[1], i)], i])
        # Marcar el nodo actual como visitado
        visited[p[1]] = 1
    # Devolver la lista de costos mínimos
    return answer


if __name__ == '__main__':
    graph, cost = {}, {}
    graph["A"] = ["B", "C"]
    graph["C"] = ["B", "F", "D"]
    graph["B"] = ["F"]
    graph["D"] = ["E"]
    graph["E"] = ["B"]
    graph["F"] = ["E", "G"]
    graph["G"] = ["D"]
    cost[("A", "B")] = 2
    cost[("A", "C")] = 5
    cost[("B", "F")] = 1
    cost[("C", "B")] = 5
    goal = [6]
    answer = busqueda_centro_historico(goal, "A")
    print("La ruta más corta es", answer[0])
