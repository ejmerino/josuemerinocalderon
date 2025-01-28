import 'package:flutter/material.dart';
import '../controllers/gyroscope_controller.dart';
import '../models/gyroscope_model.dart';

class GyroscopeView extends StatefulWidget {
  @override
  _GyroscopeViewState createState() => _GyroscopeViewState();
}

class _GyroscopeViewState extends State<GyroscopeView> {
  final GyroscopeController _controller = GyroscopeController();
  GyroscopeData _gyroscopeData = GyroscopeData(x: 0, y: 0, z: 0);

  @override
  void initState() {
    super.initState();
    _controller.getGyroscopeData().listen((data) {
      setState(() {
        _gyroscopeData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giroscopio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Eje X: ${_gyroscopeData.x}'),
            Text('Eje Y: ${_gyroscopeData.y}'),
            Text('Eje Z: ${_gyroscopeData.z}'),
          ],
        ),
      ),
    );
  }
}
