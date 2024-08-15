import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUbiProvider with ChangeNotifier {
  Position? _currentPosition;
  Stream<Position>? _positionStream;
  String? _palabra;

  Position? get currentPosition => _currentPosition;
  String? get palabra => _palabra;

  void palabraActu(String name){
    _palabra = name;
    notifyListeners();
  }

  LocationUbiProvider() {
    _positionStream = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, 
      ),
    );

    _positionStream!.listen((Position position) {
      _currentPosition = position;
      notifyListeners();
    });
  }
}