import 'package:flutter/material.dart';
import 'package:geo_loc/views/datos.dart';
// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _locationMessage = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Geolocalización'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Text(_locationMessage),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocationAndNavigate,
        tooltip: 'Ir',
        child: const Icon(Icons.next_week_sharp),
      ),
    );
  }

  Future<void> _getCurrentLocationAndNavigate() async {
    setState(() {
      _isLoading = true; // Muestra el indicador de carga
    });

    // Navega a MyHomePage2 con valores iniciales
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage2(
          latitude: 0.0,
          longitude: 0.0,
        ),
      ),
    );

    // Obtén la ubicación en segundo plano y actualiza la vista
    final position = await _fetchCurrentLocation();

    if (position != null) {
      Navigator.of(context).pop(); // Cierra la vista anterior
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage2(
            latitude: position.latitude,
            longitude: position.longitude,
          ),
        ),
      );
    }

    setState(() {
      _isLoading = false; // Oculta el indicador de carga
    });
  }

  Future<Position?> _fetchCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _updateLocationMessage("Location services are disabled.");
      return null;
    }

    final permission = await _checkAndRequestPermission();

    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      _updateLocationMessage("Location permissions are denied.");
      return null;
    }

    try {
      return await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      _updateLocationMessage("Failed to get location.");
      return null;
    }
  }

  Future<LocationPermission> _checkAndRequestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission;
  }

  void _updateLocationMessage(String message) {
    setState(() {
      _locationMessage = message;
    });
  }
}
