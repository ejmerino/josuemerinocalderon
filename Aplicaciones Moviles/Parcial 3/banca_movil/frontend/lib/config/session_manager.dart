import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  // Método para guardar el número de cuenta
  Future<void> guardarNumeroCuenta(String numeroCuenta) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('numeroCuenta', numeroCuenta);
  }

  // Método para obtener el número de cuenta
  Future<String?> obtenerNumeroCuenta() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('numeroCuenta');
  }
}
