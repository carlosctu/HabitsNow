import 'package:flutter/material.dart';

import '../core/colors.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0; //setando o index inicial do app
  // static const List<Page> _appPages = []; --> descomentar e colocar as páginas dentro da lista assim que estiver tudo pronto

  void _onitemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } //função pra trocar de página

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          // child: _appPages.elementAt(_selectedIndex), -->descomentar para funcionar a função de troca de página

          ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
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
