import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../review.dart';

final _lightColors = [
  const Color.fromARGB(255, 177, 94, 108),
  const Color.fromARGB(255, 207, 139, 169),
  const Color.fromARGB(255, 220, 182, 213),
  const Color.fromARGB(255, 220, 182, 213),
  const Color.fromARGB(255, 179, 179, 241),
];

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    Key? key,
    required this.review,
    required this.index,
  }) : super(key: key);

  final Review review;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(review.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(
          minHeight: minHeight,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              review.title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              review.description,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
