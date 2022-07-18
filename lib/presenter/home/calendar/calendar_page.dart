import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/core/colors.dart';
import 'package:habits_now_app/presenter/widgets/custom_top_bar.dart';

import '../../widgets/customBottomBar.dart';
import '../sidebar/navigation_drawer.dart';
import 'widgets/body_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: BodyCalendarPage.diaFocado,
        simbol: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CalendarPage(), // puxar dot menu
              ),
            );
          },
          icon: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.iconDisablePage,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundPage,
      body: const BodyCalendarPage(),
      drawer: const NavigationDrawer(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
