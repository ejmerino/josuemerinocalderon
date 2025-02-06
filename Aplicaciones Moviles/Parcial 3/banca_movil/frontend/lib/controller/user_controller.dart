class UserController {
  final int usuarioId;

  UserController(this.usuarioId);  // Constructor que espera el usuarioId

  // Método para obtener el usuarioId
  int obtenerUsuarioId() {
    return usuarioId;
  }
}
