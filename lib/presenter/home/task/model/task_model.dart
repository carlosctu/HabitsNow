// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskField {
  static const createdTime = 'createdTime';
}

class Task {
  DateTime createdTime;
  String id;
  String title;
  String description;
  bool isDone;
  Task({
    required this.createdTime,
    required this.title,
    this.id = '',
    this.description = '',
    this.isDone = false,
  });
}
