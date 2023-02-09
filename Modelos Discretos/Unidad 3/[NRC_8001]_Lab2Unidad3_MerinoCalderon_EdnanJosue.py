'''
Usted debe programar el algortimo de busqueda general adaptado a su problema del taller denominado "Taller 4 : Métodos de búsqueda".

Autor: Ednan Josué Merino Calderón

Versión: 1.1
'''

def busqueda_general(objetivo, inicio):
	"""
	Función que ayuda a encontrar la lista de costos mínimos en un grafo, a partir de un nodo de inicio.

	Args:
		objetivo: es una lista de nodos deseados
		inicio: es el nodo desde el que se iniciará la búsqueda.

	Retorna:
		lista de costos mínimos desde el nodo de inicio hasta cada nodo en la lista de objetivos.
	"""
	# costoo mínimo hasta
	# el estado objetivo desde el inicio
	global grafo, costo
	respuesta = []
	# crear una cola de prioridad
	cola = []

	# establecer el vector de respuesta en un valor máximo
	for i in range(len(objetivo)):
		respuesta.append(10**8)

	# insertar el índice de inicio
	cola.append([0, inicio])
	# mapa para almacenar nodo visitado
	visitado = {}
	# contador
	contador = 0

	# mientras la cola no esté vacía
	while (len(cola) > 0):
		# obtener el elemento superior de la
		cola = sorted(cola)
		p = cola[-1]
		# eliminar el elemento
		del cola[-1]
		# obtener el valor original
		p[0] *= -1
		# verificar si el elemento es parte de
		# la lista de objetivos
		if (p[1] in objetivo):
			# obtener la posición
			índice = objetivo.index(p[1])
			# si se alcanza un nuevo objetivo
			if (respuesta[índice] == 10**8):
				contador += 1
			# si el costoo es menor
			if (respuesta[índice] > p[0]):
				respuesta[índice] = p[0]
			# eliminar el elemento
			del cola[-1]
			cola = sorted(cola)
			if (contador == len(objetivo)):
				return respuesta

		# verificar los nodos no visitados
		# que están adyacentes al nodo presente
		if (p[1] not in visitado):
			for i in range(len(grafo[p[1]])):
				# el valor se multiplica por -1 para que
				# la prioridad mínima esté en la parte superior
				cola.append( [(p[0] + costo[(p[1], grafo[p[1]][i])])* -1, grafo[p[1]][i]])

		# marcar como visitado
		visitado[p[1]] = 1

	return respuesta

# función principal
if __name__ == '__main__':
	
    # crear el grafo
    grafo, costo = [[] for i in range(8)],{}

    # el grafo es una lista de listas. Cada elemento
	

    print(grafo, costo)
	
	
    grafo[0].append(1)
    grafo[0].append(3)
    grafo[3].append(1)
    grafo[3].append(6)
    grafo[3].append(4)
    grafo[1].append(6)
    grafo[4].append(2)
    grafo[4].append(5)
    grafo[2].append(1)
    grafo[5].append(2)
    grafo[5].append(6)
    grafo[6].append(4)

    # add the costo
    costo[(0, 1)] = 2
    costo[(0, 3)] = 5
    costo[(1, 6)] = 1
    costo[(3, 1)] = 5
    costo[(3, 6)] = 6
    costo[(3, 4)] = 2
    costo[(2, 1)] = 4
    costo[(4, 2)] = 4
    costo[(4, 5)] = 3
    costo[(5, 2)] = 6
    costo[(5, 6)] = 3
    costo[(6, 4)] = 7

    print(grafo, costo)

    # estado del objetivo
    objetivo = []

    # se establece la meta
    # pueden haber múltiples objetvios
    objetivo.append(6)

    # get the answer
    answer = busqueda_general(objetivo, 0)
	
    # print the answer
    print("El costo mínimo desde 0 hasta 6 es:  ",answer[0])
