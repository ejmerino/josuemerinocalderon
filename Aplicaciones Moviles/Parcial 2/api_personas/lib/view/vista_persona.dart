// views/vista_persona.dart
import 'package:flutter/material.dart';
import '../model/modelo_persona.dart';
import '../controller/controlador_persona.dart';

class VistaPersona extends StatefulWidget {
  @override
  _VistaPersonaState createState() => _VistaPersonaState();
}

class _VistaPersonaState extends State<VistaPersona> {
  List<Persona> _personas = [];
  final PersonaService personaService = PersonaService();

  @override
  void initState() {
    super.initState();
    _actualizarLista();
  }

  Future<void> _actualizarLista() async {
    try {
      List<Persona> personas = await personaService.obtenerPersonas();
      setState(() {
        _personas = personas;
      });
    } catch (e) {
      print("Error al cargar personas: $e");
    }
  }

  void _mostrarFormulario({Persona? persona}) {
    final nombreController = TextEditingController();
    final apellidoController = TextEditingController();
    final telefonoController = TextEditingController();

    if (persona != null) {
      nombreController.text = persona.nombre;
      apellidoController.text = persona.apellido;
      telefonoController.text = persona.telefono;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(persona == null ? 'Agregar Persona' : 'Editar Persona'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextField(
                controller: telefonoController,
                decoration: InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                final nombre = nombreController.text.trim();
                final apellido = apellidoController.text.trim();
                final telefono = telefonoController.text.trim();

                if (nombre.isNotEmpty && apellido.isNotEmpty && telefono.isNotEmpty) {
                  try {
                    final nuevaPersona = Persona(
                      id: persona?.id ?? '',
                      nombre: nombre,
                      apellido: apellido,
                      telefono: telefono,
                    );
                    if (persona == null) {
                      // Crear nueva persona
                      await personaService.crearPersona(nuevaPersona);
                    } else {
                      // Actualizar persona existente
                      await personaService.actualizarPersona(persona.id, nuevaPersona);
                    }
                    _actualizarLista();
                    Navigator.pop(context);
                  } catch (e) {
                    print('Error al guardar persona: $e');
                  }
                }
              },
              child: Text(persona == null ? 'Agregar' : 'Actualizar'),
            ),
          ],
        );
      },
    );
  }

  void _eliminarPersona(String id) async {
    try {
      await personaService.eliminarPersona(id);
      _actualizarLista();
    } catch (e) {
      print("Error al eliminar persona: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Personas'),
      ),
      body: ListView.builder(
        itemCount: _personas.length,
        itemBuilder: (context, index) {
          final persona = _personas[index];
          return ListTile(
            title: Text('${persona.nombre} ${persona.apellido}'), // Concatenación con espacio
            subtitle: Text(persona.telefono),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _mostrarFormulario(persona: persona),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _eliminarPersona(persona.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mostrarFormulario(),
        child: Icon(Icons.add),
        tooltip: 'Agregar Persona',
      ),
    );
  }
}
