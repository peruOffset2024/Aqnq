import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> authenticate(String username, String password) async{
    await Future.delayed(const Duration(seconds: 2));
    _isAuthenticated = username == 'user' && password == 'pass';
    notifyListeners();
  }

}