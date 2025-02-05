import 'package:flutter/material.dart';
import '../modelo/usuario_modelo.dart';
import '../controlador/usuario_controlador.dart';

class EliminarUsuario {
  static void mostrarDialogo({
    required BuildContext context,
    required Usuario usuario,
    required VoidCallback refrescarLista,
  }) {
    final UsuarioControlador _controlador = UsuarioControlador();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.red),
            SizedBox(width: 10),
            Text('Eliminar Usuario', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        content: Text(
          '¿Estás seguro de eliminar a ${usuario.nombre}?',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey.shade700,
            ),
            child: Text('Cancelar', style: TextStyle(fontSize: 16)),
          ),
          ElevatedButton(
            onPressed: () async {
              await _controlador.eliminarUsuario(usuario.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Usuario eliminado con éxito', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.redAccent,
                ),
              );
              refrescarLista();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Eliminar', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
