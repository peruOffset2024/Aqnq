import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geo_loc/providers/LocationProvider.dart';
import 'package:geo_loc/views/datos.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Geolocalización'),
      ),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text('Presiona el botón para obtener la ubicación'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage2() ));
        },
        tooltip: 'Ir',
        child: const Icon(Icons.next_week_sharp),
      ),
    );
  }

 /* Future<void> _getCurrentLocationAndNavigate(BuildContext context) async {
    // Obtener el LocationProvider
    final locationProvider = context.read<LocationProvider>();

    // Iniciar la obtención de la ubicación
    await locationProvider.fetchCurrentLocation();

    // Navegar a MyHomePage2
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage2()),
    );
  }*/
}
