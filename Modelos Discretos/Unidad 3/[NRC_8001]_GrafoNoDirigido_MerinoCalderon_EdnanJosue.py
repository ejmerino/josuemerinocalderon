class GrafoNoDirigido:
    # Método constructor para inicializar el grafo
    def __init__(self):
        # Creación de un diccionario para almacenar el grafo
        self.grafo = {}

    # Método para agregar una arista entre dos vértices
    def agregar_arista(self, vertice1, vertice2):
        """
        Función que agrega la arista entre dos vértices
        -----------------------------------------------------
        Args:
            vertice1: vértice 1 que se unirá con el vértice 2
            vertice2: vértice 2 que se unirá con el vértice 1
        -----------------------------------------------------
        Retorna:
            No retorna nada
        """
        # Verificación si los vértices ya están en el grafo, si no, se agrega
        if vertice1 not in self.grafo:
            self.grafo[vertice1] = []
        if vertice2 not in self.grafo:
            self.grafo[vertice2] = []
        # Agregar vértice2 a la lista de adyacencia de vertice1
        self.grafo[vertice1].append(vertice2)
        # Agregar vértice1 a la lista de adyacencia de vertice2
        self.grafo[vertice2].append(vertice1)

    # Método para obtener los vértices adyacentes a un vértice dado
    def obtener_adyacentes(self, vertice):
        """
        Es una función que se utiliza para obtener una lista de vértices adyacentes 
        a un vértice dado en el grafo.
        ---------------------------------------------------------------------------
        Args:
            vertice: vértice para el cual se desea obtener sus vértices adyacentes.
        ---------------------------------------------------------------------------
        Returns:
            Si el vértice existe, se regresa su lista de vértices adyacentes, 
            en caso contrario se regresa una lista vacía.
        """
        # Regresar los vértices adyacentes o una lista vacía si el vértice no existe
        return self.grafo.get(vertice, [])

# Creación del grafo
g = GrafoNoDirigido()

# Agregar una arista desde el vertice "a" hasta el vertice "b"
g.agregar_arista("a", "b")
g.agregar_arista("a", "c")
g.agregar_arista("d", "b")
g.agregar_arista("d", "c")
g.agregar_arista("b", "c")

# Verificar que las aristas se agregó correctamente
print("Las Aristas del grafo junto con sus adyacentes:",g.grafo) 
