class LogicaLogin{
  bool  verificarCredenciales(String usuario, String contrasena){
    const usuarioValido="admin";
    const contrasenaValida="12345";

    return usuario == usuarioValido && contrasena==contrasenaValida;
  }
}