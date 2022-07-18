import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/core/colors.dart';
import 'package:habits_now_app/presenter/widgets/custom_top_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/customBottomBar.dart';
import '../sidebar/navigation_drawer.dart';
import 'widgets/body_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);
  static String diaFocado = _CalendarPageState.diaFocado!;
  CalendarFormat formato = _CalendarPageState.formato;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  static String? diaFocado = BodyCalendarPage.diaFocado;
  static CalendarFormat formato = CalendarFormat.week;

  @override
  void initState() {
    diaFocado = "Hoje";
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopBar(
        title: diaFocado!,
        simbol: IconButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const CalendarPage(), // puxar dot menu
            //   ),
            // );
            setState(() {
              formato = CalendarFormat.month;
            });
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
