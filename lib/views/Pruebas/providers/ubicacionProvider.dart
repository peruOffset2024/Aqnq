import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUbiProvider with ChangeNotifier {
  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  // Método público para iniciar la obtención de la ubicación.
  void fetchLocation() async {
    try {
      // Obtiene la ubicación en segundo plano.
      _currentPosition = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      notifyListeners(); // Notifica a los widgets que la ubicación ha sido obtenida.
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener la ubicación: $e');
    }
  }
}
