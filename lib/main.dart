import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presenter/core/colors.dart';
import 'presenter/home/habits/state/provider/habits_provider.dart';
import 'presenter/home/sidebar/widgets/navigation_provider.dart';
import 'presenter/home/task/provider/task_provider.dart';
import 'presenter/home/task/task.dart';
import 'presenter/widgets/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
          child: const TaskPage(),
        ),
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
        ),
        ChangeNotifierProvider<HabitsProvider>(
          create: (context) => HabitsProvider(),
        ),
      ],
      child: MaterialApp(
        color: AppColors.backgroundPage,
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: "Main Page",
        home: const SplashPage(),
      ),
    ),
  );
}
