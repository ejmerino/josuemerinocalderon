import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config/ApiConfig.dart';
import '../model/tarjeta.dart';
import 'solicitar_tarjeta_view.dart';

class TarjetaView extends StatefulWidget {
  @override
  _TarjetaViewState createState() => _TarjetaViewState();
}

class _TarjetaViewState extends State<TarjetaView> {
  List<Tarjeta> _tarjetas = [];
  bool _isLoading = true;
  int _usuarioId = 0;

  @override
  void initState() {
    super.initState();
    _cargarUsuarioId();
  }

  Future<void> _cargarUsuarioId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usuarioId = prefs.getInt('usuarioId') ?? 0;
      _loadTarjetas();
    });
  }

  Future<void> _loadTarjetas() async {
    setState(() {
      _isLoading = true;
    });

    if (_usuarioId == 0) {
      mostrarSnackBar('Error: usuarioId no encontrado', Colors.red); // Usar función para SnackBar
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final String url = '${ApiConfig.baseUrl}/tarjetas/usuario/$_usuarioId';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _tarjetas = data.map((json) => Tarjeta.fromJson(json)).toList();
        });
      } else {
        print('Error al cargar tarjetas: ${response.statusCode}');
        print('Response body: ${response.body}');
        mostrarSnackBar('Error al cargar tarjetas: ${response.body}', Colors.red); // Usar función
      }
    } catch (e) {
      print('Error de conexión: $e');
      mostrarSnackBar('Error de conexión al cargar tarjetas', Colors.red); // Usar función
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleEstadoTarjeta(Tarjeta tarjeta) async {
    final String url = '${ApiConfig.baseUrl}/tarjetas/${tarjeta.estado ? 'congelar' : 'descongelar'}/${tarjeta.id}';
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        _loadTarjetas();
        mostrarSnackBar('Tarjeta ${tarjeta.estado ? 'congelada' : 'descongelada'}', Colors.green); // Usar función
      } else {
        print('Error al cambiar estado de la tarjeta: ${response.statusCode}');
        print('Response body: ${response.body}');
        mostrarSnackBar('Error al cambiar estado de la tarjeta: ${response.body}', Colors.red); // Usar función
      }
    } catch (e) {
      print('Error de conexión: $e');
      mostrarSnackBar('Error de conexión al cambiar estado de la tarjeta', Colors.red); // Usar función
    }
  }

  Future<void> _eliminarTarjeta(Tarjeta tarjeta) async {
    final String url = '${ApiConfig.baseUrl}/tarjetas/eliminar/${tarjeta.id}';
    try {
      final response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        _loadTarjetas();
        _mostrarAlerta('Tarjeta eliminada con éxito');
      } else {
        print('Error al eliminar la tarjeta: ${response.statusCode}');
        print('Response body: ${response.body}');
        mostrarSnackBar('Error al eliminar la tarjeta: ${response.body}', Colors.red); // Usar función
      }
    } catch (e) {
      print('Error de conexión: $e');
      mostrarSnackBar('Error de conexión al eliminar la tarjeta', Colors.red); // Usar función
    }
  }

  void _mostrarAlerta(String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Éxito'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar SnackBar personalizado
  void mostrarSnackBar(String mensaje, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje, style: TextStyle(color: Colors.white)),
        backgroundColor: color,
        duration: Duration(seconds: 3), // Duración configurable
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding más espacioso
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
        behavior: SnackBarBehavior.floating, // SnackBar flotante
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1A237E),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          _tarjetas.isEmpty
              ? Expanded(child: Center(child: Text('No tienes tarjetas registradas')))
              : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: _tarjetas.map((tarjeta) =>
                      CreditCardWidget(tarjeta: tarjeta, onEliminar: _eliminarTarjeta, onToggleEstado: _toggleEstadoTarjeta,)
                  ).toList(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _tarjetas.length >= 3 ? null : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SolicitarTarjetaView(
                        onTarjetaSolicitada: _loadTarjetas)),
              );
            },
            child: Text('Solicitar Tarjeta', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1A237E)),
          ),
          if (_tarjetas.length >= 3)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Has alcanzado el límite de 3 tarjetas.', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
    );
  }
}

class CreditCardWidget extends StatefulWidget {
  final Tarjeta tarjeta;
  final Function(Tarjeta) onToggleEstado;
  final Function(Tarjeta) onEliminar;

  CreditCardWidget({Key? key, required this.tarjeta, required this.onToggleEstado, required this.onEliminar}) : super(key: key);

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;
  bool _obscureNumber = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isFlipped = !_isFlipped;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(3.1415927 * _animation.value),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.tarjeta.marca == 'Visa'
                  ? [Colors.green, Colors.teal]
                  : widget.tarjeta.marca == 'Mastercard' ? [Colors.purple, Colors.deepPurple] : [Colors.grey, Colors.blueGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Card(
            elevation: 4,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: _animation.value < 0.5 ? _buildFrontView() : _buildBackView(),
          ),
        ),
      ),
    );
  }

  Widget _buildFrontView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCardTypeIcon(widget.tarjeta.marca),
              IconButton(
                icon: Icon(
                  _obscureNumber ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() {
                    _obscureNumber = !_obscureNumber;
                  });
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _obscureNumber
                    ? '**** **** **** ${widget.tarjeta.numero.substring(widget.tarjeta.numero.length - 4)}'
                    : widget.tarjeta.numero,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'Expira: ${widget.tarjeta.mesExpiracion}/${widget.tarjeta.anioExpiracion}',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Text(
                'CVV: ${widget.tarjeta.cvv}',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              Text(
                'Marca: ${widget.tarjeta.marca}',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackView() {
    return Transform.scale(
      scaleX: -1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('¿Qué deseas hacer?', style: TextStyle(fontSize: 18, color: Colors.white)),
            ElevatedButton(
              onPressed: () {
                //widget.onToggleEstado(widget.tarjeta);
                _mostrarConfirmacionToggleEstado(widget.tarjeta);
              },
              child: Text(widget.tarjeta.estado ? 'Congelar' : 'Descongelar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
            ElevatedButton(
              onPressed: () {
                // widget.onEliminar(widget.tarjeta);
                _mostrarConfirmacionEliminar(widget.tarjeta);
              },
              child: Text('Eliminar Tarjeta', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTypeIcon(String marca) {
    IconData iconData;
    switch (marca) {
      case 'Visa':
        iconData = Icons.credit_card;
        break;
      case 'Mastercard':
        iconData = Icons.credit_card;
        break;
      default:
        iconData = Icons.warning;
        break;
    }
    return Icon(
      iconData,
      size: 32,
      color: Colors.white,
    );
  }

  void _mostrarConfirmacionToggleEstado(Tarjeta tarjeta) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('¿Seguro que quieres ${tarjeta.estado ? 'CONGELAR' : 'DESCONGELAR'} esta tarjeta?', style: TextStyle(fontSize: 16)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700], // Color del texto "Cancelar"
              ),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onToggleEstado(tarjeta);
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tarjeta.estado ? Colors.blue[800] : Colors.redAccent, // Color del botón "Confirmar"
                textStyle: TextStyle(fontWeight: FontWeight.bold), // Estilo del texto "Confirmar"
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados del botón
              ),
              child: Text('Confirmar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }


  void _mostrarConfirmacionEliminar(Tarjeta tarjeta) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text('¿Estás seguro de que deseas ELIMINAR esta tarjeta? Esta acción es irreversible.', style: TextStyle(fontSize: 16)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[700], // Color del texto "Cancelar"
              ),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                widget.onEliminar(tarjeta);
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800], // Color del botón "Eliminar"
                textStyle: TextStyle(fontWeight: FontWeight.bold), // Estilo del texto "Eliminar"
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados del botón
              ),
              child: Text('Eliminar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}