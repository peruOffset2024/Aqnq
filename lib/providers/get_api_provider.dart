import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider with ChangeNotifier {
  List<String> _items = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<String> get items => _items;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _items = data.map((item) => item['title'].toString()).toList();
      } else {
        _errorMessage = 'Failed to load data';
      }
    } catch (error) {
      _errorMessage = 'An error occurred';
    }

    _isLoading = false;
    notifyListeners();
  }
}
