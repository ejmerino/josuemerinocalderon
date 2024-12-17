from flask import Flask, request, jsonify
import redis
import nltk
from nltk.tokenize import word_tokenize

# Descargar recursos de NLTK
nltk.download('punkt')

# Conectar a Redis
r = redis.Redis(host='localhost', port=6379, db=0)

app = Flask(__name__)

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

@app.route('/recommend', methods=['POST'])
def get_recommendations():
    data = request.get_json()
    input_text = data['input_text']
    recommendations = recommend_products(input_text)
    return jsonify(recommendations)

if __name__ == '__main__':
    app.run(debug=True)