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
  int _usuarioId = 0; // Inicializamos con un valor por defecto

  @override
  void initState() {
    super.initState();
    _cargarUsuarioId();
  }

  Future<void> _cargarUsuarioId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _usuarioId = prefs.getInt('usuarioId') ?? 0; // Recupera el usuarioId o usa 0 si no existe
      _loadTarjetas(); // Llama a _loadTarjetas después de cargar el usuarioId
    });
  }

  Future<void> _loadTarjetas() async {
    setState(() {
      _isLoading = true;
    });

    // Verifica que _usuarioId sea mayor que 0 antes de llamar a la API
    if (_usuarioId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: usuarioId no encontrado')),
      );
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar tarjetas: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión al cargar tarjetas')),
      );
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
        // Recargar las tarjetas para actualizar la lista
        _loadTarjetas();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tarjeta ${tarjeta.estado ? 'congelada' : 'descongelada'}')),
        );
      } else {
        print('Error al cambiar estado de la tarjeta: ${response.statusCode}');
        print('Response body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cambiar estado de la tarjeta: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error de conexión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión al cambiar estado de la tarjeta')),
      );
    }
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
              : Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(16),
              itemCount: _tarjetas.length,
              itemBuilder: (context, index) {
                final tarjeta = _tarjetas[index];
                return Container(
                  width: 300,
                  margin: EdgeInsets.only(right: 16),
                  child: CreditCardWidget(tarjeta: tarjeta, onToggleEstado: _toggleEstadoTarjeta),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
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
        ],
      ),
    );
  }
}

class CreditCardWidget extends StatefulWidget {
  final Tarjeta tarjeta;
  final Function(Tarjeta) onToggleEstado;

  CreditCardWidget({required this.tarjeta, required this.onToggleEstado});

  @override
  _CreditCardWidgetState createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A237E), Color(0xFF3F51B5)],
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
          _buildCardTypeIcon(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '**** **** **** ${widget.tarjeta.numero.substring(widget.tarjeta.numero.length - 4)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'Expira: ${widget.tarjeta.mesExpiracion}/${widget.tarjeta.anioExpiracion}',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackView() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A237E), Color(0xFF3F51B5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('¿Congelar tarjeta?', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onToggleEstado(widget.tarjeta);
              },
              child: Text(widget.tarjeta.estado ? 'Congelar' : 'Descongelar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardTypeIcon() {
    // Aquí puedes implementar la lógica para determinar el tipo de tarjeta
    // (Visa, MasterCard, etc.) basándote en el número de la tarjeta
    // y mostrar el icono correspondiente
    return Icon(Icons.credit_card, size: 32, color: Colors.white);
  }
}