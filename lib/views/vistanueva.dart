import 'package:flutter/material.dart';
import 'package:geo_loc/views/vista.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Geolocalización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
    final result = await _fetchCurrentLocation();

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage2(
            latitude: result.latitude,
            longitude: result.longitude,
          ),
        ),
      );
    }
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
