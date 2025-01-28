import 'package:flutter/material.dart';
import 'views/gyroscope_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GyroscopeView(),
    );
  }
}
