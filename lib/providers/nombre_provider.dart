import 'package:flutter/material.dart';

class NombreNuevoProvider with ChangeNotifier{
  String _nombre = 'Ricardo';

  String get nombre => _nombre;

  void actualizarNombre(String nuevoNombre){
    _nombre = nuevoNombre;
    notifyListeners();
  }

}