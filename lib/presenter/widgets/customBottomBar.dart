import 'package:flutter/material.dart';
import 'package:habits_now_app/main.dart';
import 'package:habits_now_app/presenter/home/calendar/calendar_page.dart';
import 'package:habits_now_app/presenter/home/home_page.dart';
import '../core/colors.dart';
import '../home/sidebar/navigation_drawer.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0; //setando o index inicial do app
  // Carlos: Coloquei 4 CalendarPage() para evitar dar erro ao clickar em outro index do Nav Bottom Bar
  static const List<Widget> _appPages = [CalendarPage(),CalendarPage(),CalendarPage(),CalendarPage()]; //--> descomentar e colocar as páginas dentro da lista assim que estiver tudo pronto

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } //função pra trocar de página

  // body: Center(
  // child: _appPages.elementAt(_selectedIndex), -->descomentar para funcionar a função de troca de página
  // ),
  @override
  Widget build(BuildContext context) => BottomNavigationBar(

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
      );
}
