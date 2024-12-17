import redis
import requests

# Conectar a Redis
r = redis.Redis(host='localhost', port=6379, db=0)

# Obtener datos de productos de la API de Fake Store
url = "https://fakestoreapi.com/products"
response = requests.get(url)
products = response.json()

# Procesar los datos de productos y almacenarlos en Redis
for product in products:
    r.set(product["id"], product["title"])

# Implementar un algoritmo de recomendación simple
def recommend_products(input_text):
    recommendations = []
    for key in r.keys():
        title = r.get(key).decode('utf-8')
        if input_text.lower() in title.lower():
            recommendations.append(title)
    return recommendations

# Hacer recomendaciones basadas en una entrada de texto
input_text = "shirt"
recommendations = recommend_products(input_text)
print("Recomendaciones:")
for recommendation in recommendations:
    print(recommendation)