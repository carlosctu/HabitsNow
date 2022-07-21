import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/habits/widgets/show_modal_button.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/configuration_page.dart';
import 'package:habits_now_app/presenter/home/task/task.dart';
import '../core/colors.dart';
import 'calendar/calendar_page.dart';
import 'habits/habits_page.dart';
import 'sidebar/navigation_drawer.dart';
import 'sidebar/widgets/alert_box_bepremium.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; //setando o index inicial do app
  static final List<Widget> _appPages = [
    CalendarPage(),
    HabitsPage(),
    TaskPage(),
    ConfigurationPage(),
  ]; //--> descomentar e colocar as páginas dentro da lista assim que estiver tudo pronto

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } //função pra trocar de página

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Page"),
      // ),
      body: Center(
        child: _appPages.elementAt(_selectedIndex),
      ),
      drawer: const NavigationDrawer(),
      floatingActionButton: ShowModalButton(),
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.iconActivePage,
        onTap: _onitemTapped,
      ),
    );
  }
}
