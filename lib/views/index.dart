import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/providers/ubicacionProvider.dart';
import 'package:geo_loc/views/comentarios.dart';
import 'package:provider/provider.dart';


class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.read<LocationUbiProvider>();

    // Inicia la obtención de la ubicación cuando se construya la pantalla.
    locationProvider.fetchLocation();

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