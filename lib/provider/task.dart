import 'package:flutter/material.dart';

enum Status { InProgress, Completed }

class Task with ChangeNotifier {
  int id;
  String title;
  DateTime date;
  TimeOfDay time;
  Status? status;

  Task(
      {required this.id,
      required this.title,
      required this.date,
      required this.time,
      this.status});
}

class Tasks with ChangeNotifier {
  List<Task> _tasks = [
    Task(id: 1, title: 'Title1', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: 2, title: 'Title2', date: DateTime.now(), time: TimeOfDay.now()),
    Task(id: 3, title: 'Title3', date: DateTime.now(), time: TimeOfDay.now()),
  ];

  List<Task> tasks({Status? status}) =>
      _tasks.where((element) => element.status == status).toList();

  void addTask(String title, DateTime date, TimeOfDay time) {
    _tasks
        .add(Task(id: _tasks.length + 1, title: title, date: date, time: time));
    notifyListeners();
  }

  void changeStatus(int id, Status status) {
    _tasks.firstWhere((element) => element.id == id).status = status;
    notifyListeners();
  }

  void removeTasks(int id) {
    _tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
