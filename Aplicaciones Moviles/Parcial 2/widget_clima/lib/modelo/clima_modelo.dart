class ClimaModelo {
  final String ciudad;
  final double temperatura;
  final String descripcion;

  ClimaModelo({
    required this.ciudad,
    required this.temperatura,
    required this.descripcion,
  });

  // Factory para parsear la respuesta de la API
  factory ClimaModelo.fromJson(Map<String, dynamic> json) {
    return ClimaModelo(
      ciudad: json['name'], // 'name' es el nombre de la ciudad
      temperatura: json['main']['temp'].toDouble(), // 'main.temp' es la temperatura
      descripcion: json['weather'][0]['description'], // 'weather[0].description' es la descripción
    );
  }
}
