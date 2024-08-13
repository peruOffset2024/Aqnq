import 'package:flutter/material.dart';

class NombreProvider with ChangeNotifier{
  String _nombre = '';

  String get nombre => _nombre;

  void updateName(String newNombre){
    _nombre = newNombre;
    notifyListeners();
  }

}