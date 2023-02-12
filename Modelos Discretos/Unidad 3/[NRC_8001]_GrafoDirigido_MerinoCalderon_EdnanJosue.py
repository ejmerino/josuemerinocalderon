# Creo la clase GrafoDirigido
class GrafoDirigido:
    # El método __init__ se llama automáticamente al crear una instancia de la clase
    def __init__(self):
        """
        Método constructor de la clase.

        En este caso, el único propósito de este método es inicializar el atributo self.grafo 
        como un diccionario vacío, el cual será utilizado para almacenar el grafo.
        """
        # Inicializamos el diccionario que representa el GrafoDirigido
        self.GrafoDirigido = {}
        
    # Método para agregar una arista entre dos vertices
    def agregar_arista(self, origen, destino):
        """
        Se utiliza para agregar una arista entre dos vértices en el grafo.
        ------------------------------------------
        Args:
            origen: Extremo origen de la arista
            destino: Extremo destino de la arista
        ------------------------------------------
        No retorna nada
        """
        # Verificamos si el vertice origen ya existe en el GrafoDirigido
        if origen not in self.GrafoDirigido:
            # Si no existe, lo agregamos y le asignamos una lista con el vertice destino como único elemento
            self.GrafoDirigido[origen] = [destino]
        else:
            # Si ya existe, solo agregamos el vertice destino a la lista de adyacentes
            self.GrafoDirigido[origen].append(destino)
            
    # Método para obtener los vertices adyacentes a un vertice dado
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
        # Devolvemos la lista de vertices adyacentes al vertice dado
        return self.GrafoDirigido[vertice]
    
# Creamos una instancia de la clase GrafoDirigido
g = GrafoDirigido()

# Agregamos tres aristas al GrafoDirigido
g.agregar_arista("A", "B")
g.agregar_arista("A", "C")
g.agregar_arista("B", "C")
g.agregar_arista("B", "D")
g.agregar_arista("C", "D")

# Obtenemos los vertices adyacentes a un vertice dado y los imprimimos
print("Los Nodos Adyacentes de A:",g.obtener_adyacentes("A"))
print("Los Nodos Adyacentes de B:",g.obtener_adyacentes("B"))
print("Los Nodos Adyacentes de C:",g.obtener_adyacentes("C"))
