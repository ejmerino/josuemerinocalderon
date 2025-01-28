import 'package:sensors_plus/sensors_plus.dart';
import '../models/gyroscope_model.dart';

class GyroscopeController {
  // Función para obtener los datos del giroscopio
  Stream<GyroscopeData> getGyroscopeData() {
    return SensorsPlus.gyroscopeEvents.map((event) {
      return GyroscopeData(x: event.x, y: event.y, z: event.z);
    });
  }
}
