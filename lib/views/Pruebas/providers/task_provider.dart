import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/models/task.dart';

class TaskProvider with ChangeNotifier{
  final List<Task> _taks = [];

  List<Task> get tasks => _taks;

  void addTask(String title){
    _taks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTaskCompletion(int index){
    final task = _taks[index];
    _taks[index] = Task(title: task.title, isCompleted: !task.isCompleted);
    notifyListeners();
  }

}