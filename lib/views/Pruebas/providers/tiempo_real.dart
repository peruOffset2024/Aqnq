import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocProvider with ChangeNotifier {
  Position? _currentPosition;
  Stream<Position>? _positionStream;

  Position? get currentPosition => _currentPosition;

  LocProvider() {
    // Configura el flujo de posición al inicializar el provider
    _positionStream = Geolocator.getPositionStream();
    _positionStream!.listen((Position position) {
      _currentPosition = position;
      notifyListeners(); // Notifica a los widgets que la ubicación ha cambiado
    });
  }

  // Método opcional para obtener la ubicación actual inmediatamente
  Future<void> getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      notifyListeners();
    } catch (e) {
      print('Error al obtener la ubicación: $e');
    }
  }
}
