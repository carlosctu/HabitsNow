import 'package:flutter/widgets.dart';

import '../model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _task = [];

  List<Task> get tasks => _task.where((task) => task.isDone == false).toList();

  void addTask(Task task) {
    _task.add(task);

    notifyListeners();
  }

  void removeTask(Task task) {
    _task.remove(task);

    notifyListeners();
  }
}
