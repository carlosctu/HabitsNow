import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/widgets/customBottomBar.dart';

void main() {
  runApp(
    MaterialApp(
      home: const CustomBottomBar(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    ),
  );
}
