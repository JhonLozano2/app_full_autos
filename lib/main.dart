import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaInicio(),
    );
  }
}

