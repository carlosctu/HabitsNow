import 'package:flutter/material.dart';

import '../model/habits_model.dart';

class HabitsProvider extends ChangeNotifier {
  final List<Habits> _habits = [];

  List<Habits> get habits =>
      _habits.where((habits) => habits.isDone == false).toList();

  void addHabits(Habits habits) {
    _habits.add(habits);

    notifyListeners();
  }

  void removeHabits(Habits habits) {
    _habits.remove(habits);

    notifyListeners();
  }
}
