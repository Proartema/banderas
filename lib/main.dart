//import 'package:banderas/models/hombre_maquina_v2.dart';
import 'package:banderas/screen/pantalla.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Banderas());

class Banderas extends StatelessWidget {
  const Banderas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Banderas',
      debugShowCheckedModeBanner: false,
      home: Pantalla(),
    );
  }
}
