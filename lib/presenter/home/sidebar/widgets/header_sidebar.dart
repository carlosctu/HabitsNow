import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderSideBar extends StatelessWidget {
  const HeaderSideBar({
    Key? key,
    required this.dayFormat,
    required this.dateTime,
    required this.dateFormat,
  }) : super(key: key);

  final DateFormat dayFormat;
  final DateTime dateTime;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "HabitsNow",
          style: TextStyle(
            color: Color.fromARGB(255, 213, 32, 89),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          dayFormat.format(dateTime),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          dateFormat.format(dateTime),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
