import redis
import requests
import nltk
from nltk.tokenize import word_tokenize

# Descargar recursos de NLTK
nltk.download('punkt')

# Conectar a Redis
r = redis.Redis(host='localhost', port=6379, db=0)

# Obtener datos de productos de la API de Fake Store
url = "https://fakestoreapi.com/products"
response = requests.get(url)
products = response.json()

# Procesar los datos de productos y almacenarlos en Redis
for product in products:
    r.set(product["id"], product["title"])

# Implementar un algoritmo de recomendación mejorado
def recommend_products(input_text):
    recommendations = []
    input_tokens = word_tokenize(input_text.lower())
    for key in r.keys():
        title = r.get(key).decode('utf-8')
        title_tokens = word_tokenize(title.lower())
        if any(token in title_tokens for token in input_tokens):
            recommendations.append(title)
    return recommendations

# Hacer recomendaciones basadas en una entrada de texto
input_text = "blue shirt"
recommendations = recommend_products(input_text)
print("Recomendaciones:")
for recommendation in recommendations:
    print(recommendation)