import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/models/counter.dart';

class ContadorProviders with ChangeNotifier{
  List<CountersNum> _counter = [];
 

  List<CountersNum> get counter => _counter;



  void SumarContador(){
    _counter.add(CountersNum());
    notifyListeners();
  }

  void eliminarContador(CountersNum counter){
    _counter.remove(counter);
    notifyListeners();
  }

  void imcrementarContador(CountersNum counter){
    counter.incrementar();
    notifyListeners();
  }

  void disminuirContador(CountersNum counter){
    counter.disminuir();
    notifyListeners();
  }

}