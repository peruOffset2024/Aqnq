import 'package:flutter/material.dart';


class ComentarioProvider with ChangeNotifier{
  String _nombre = '';

  String get nombre => _nombre;

  set comentario(String value){
    _nombre = value;
    notifyListeners();
  }

  
}