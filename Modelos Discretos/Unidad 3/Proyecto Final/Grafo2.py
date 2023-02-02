def dijkstra(graph, start, end):
    distances = {node: float('inf') for node in graph}
    previous_nodes = {node: None for node in graph}
    distances[start] = 0
    unvisited_nodes = list(graph.keys())

    while unvisited_nodes:
        current_node = min(unvisited_nodes, key=lambda node: distances[node])
        if current_node == end:
            path = []
            while current_node is not None:
                path.append(current_node)
                current_node = previous_nodes[current_node]
            return path[::-1]
        unvisited_nodes.remove(current_node)
        for neighbor, weight in graph[current_node].items():
            new_distance = distances[current_node] + weight
            if new_distance < distances[neighbor]:
                distances[neighbor] = new_distance
                previous_nodes[neighbor] = current_node

    return None

graph = {
    'Empire State Building': {'Cryslier Building': 150, 'Times Square': 112, 'Edge':800},
    'Cryslier Building': {'Empire State Building': 150, 'Times Square': 250, 'Edge': 520},
    'Times Square': {'Empire State Building': 112, 'Cryslier Building': 250, 'Edge': 700},
    'Edge': {'Cryslier Building': 520, 'Times Square': 700, 'Empire State Building': 800}
}

graph_wallstreet = {
    'Wall Street': {'WallStreet Bull': 459.24, 'Times Square':6063.22,'11-S Memorial':543.83, 'Empire State Building':5050.66},
    'WallStreet Bull': {'Wall Street':459.24, '11-S Memorial':869.83, 'Times Square':6396.55, 'Empire State Building': 5410.35}
}

print(dijkstra(graph_wallstreet, 'Wall Street', 'Times Square')) # Output: ['A', 'B', 'C', 'D']
