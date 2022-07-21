final String tableReviews = 'notes';

class ReviewsFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Review {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Review({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Review copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Review(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Review fromJson(Map<String, Object?> json) => Review(
        id: json[ReviewsFields.id] as int?,
        isImportant: json[ReviewsFields.isImportant] == 1,
        number: json[ReviewsFields.number] as int,
        title: json[ReviewsFields.title] as String,
        description: json[ReviewsFields.description] as String,
        createdTime: DateTime.parse(json[ReviewsFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        ReviewsFields.id: id,
        ReviewsFields.title: title,
        ReviewsFields.isImportant: isImportant ? 1 : 0,
        ReviewsFields.number: number,
        ReviewsFields.description: description,
        ReviewsFields.time: createdTime.toIso8601String(),
      };
}
