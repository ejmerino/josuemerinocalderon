from django.shortcuts import render
from .models import Producto
import csv
from django.http import HttpResponse

def listar_productos(request):
    productos = Producto.objects.all()
    return render(request, 'listar.html', {'productos': productos})

def exportar_csv(request):
    # Crear la respuesta HTTP con el tipo de contenido CSV
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="productos.csv"'

    # Crear un escritor CSV
    writer = csv.writer(response)
    writer.writerow(['Nombre', 'Precio', 'Cantidad'])  # Escribir la cabecera

    # Obtener todos los productos de la base de datos y escribirlos en el CSV
    productos = Producto.objects.all()
    for producto in productos:
        writer.writerow([producto.nombre, producto.precio, producto.cantidad])

    return response
