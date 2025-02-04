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
        title: Text('Eliminar Usuario'),
        content: Text('¿Estás seguro de eliminar a ${usuario.nombre}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await _controlador.eliminarUsuario(usuario.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Usuario eliminado con éxito')),
              );
              refrescarLista();
              Navigator.pop(context);
            },
            child: Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
