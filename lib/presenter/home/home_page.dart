import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../calendar/calendar_page.dart';
import '../categories/category_page.dart';
import '../habits/habits_page.dart';
import '../habits/widgets/show_modal_button.dart';
import '../sidebar/navigation_drawer.dart';
import '../task/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Widget? calendar;
  static int selectedIndex = 0;
  static final List<Widget> _appPages = [
    calendar!,
    const HabitsPage(),
    const TaskPage(),
    const CategoryPage(),
  ];

  @override
  void initState() {
    calendar = CalendarPage(callback: callback);
    super.initState();
  }

  void callback() {
    setState(
      () {
        selectedIndex = 2;
      },
    );
  }

  void _onitemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _appPages.elementAt(selectedIndex),
      ),
      drawer: const NavigationDrawer(),
      floatingActionButton: const ShowModalButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.iconDisablePage,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checklist_sharp,
              size: 30,
            ),
            label: 'Hoje',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emoji_events,
              size: 30,
            ),
            label: 'Hábitos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
              size: 30,
            ),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.widgets_outlined,
              size: 30,
            ),
            label: 'Categorias',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.iconActivePage,
        onTap: _onitemTapped,
      ),
    );
  }
}
