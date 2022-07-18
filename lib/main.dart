import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/calendar/calendar_page.dart';
import 'package:habits_now_app/presenter/widgets/customBottomBar.dart';

void main() {
  runApp(
    MaterialApp(
      home: const CalendarPage(),//CustomBottomBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    ),
  );
}
