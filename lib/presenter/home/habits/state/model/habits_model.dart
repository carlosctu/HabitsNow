class HabitsField {
  static const createdTime = 'createdTime';
}

class Habits {
  DateTime createdTime;
  String id;
  String title;
  String description;
  bool isDone;
  Habits({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.description = '',
    this.isDone = false,
  });
}
