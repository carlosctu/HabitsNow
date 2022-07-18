import 'package:flutter/material.dart';

import 'widgets/body_calendar.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: CalendarPage(),
  ));
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: BodyCalendarPage(),
    );
  }
}
