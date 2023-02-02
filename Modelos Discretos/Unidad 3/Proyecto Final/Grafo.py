import heapq

def shortest_path(graph, start, end):
    distances = {vertex: float('infinity') for vertex in graph}
    distances[start] = 0
    heap = [(0, start)]
    while heap:
        (distance, current) = heapq.heappop(heap)
        if current == end:
            break
        for neighbor in graph[current]:
            cost = distance + graph[current][neighbor]
            if cost < distances[neighbor]:
                distances[neighbor] = cost
                heapq.heappush(heap, (cost, neighbor))
    return distances[end]

if __name__ == "__main__":
    graph = {
        'Empire State': {'B': 1, 'C': 4},
        'B': {'Empire State': 1, 'C': 2, 'D': 5},
        'C': {'Empire State': 4, 'B': 2, 'D': 1},
        'D': {'B': 5, 'C': 1},
    }
    print("El Camino más rápido de A to D es:")
    print(shortest_path(graph, 'Empire State', 'D'))