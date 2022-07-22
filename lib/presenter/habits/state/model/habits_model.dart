import '../../../calendar/events.dart';

class HabitsField {
  static const createdTime = 'createdTime';
}

class Habits {
  DateTime createdTime;
  String calendar;
  String id;
  String title;
  String description;
  bool isDone;
  Event? evento;
  Habits({
    required this.createdTime,
    required this.title,
    this.calendar = '',
    this.id = '',
    this.description = '',
    this.isDone = false,
    this.evento
  });
}
