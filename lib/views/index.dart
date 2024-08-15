import 'package:flutter/material.dart';
import 'package:geo_loc/views/comentarios.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage3()),
            );
          },
          child: const Text('Ir a la otra vista'),
        ),
      ),
    );
  }
}
