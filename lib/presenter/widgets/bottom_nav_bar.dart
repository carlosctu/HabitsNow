// import 'package:flutter/material.dart';

// import '../../core/colors.dart';

// class CustomBottomBar extends StatefulWidget {
//   const CustomBottomBar({Key? key}) : super(key: key);

//   @override
//   State<CustomBottomBar> createState() => _CustomBottomBarState();
// }

// class _CustomBottomBarState extends State<CustomBottomBar> {
//   int selectedIndex = 0;

//   void _onitemTapped(int index) {
//     setState(
//       () {
//         selectedIndex = index;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       unselectedItemColor: AppColors.iconDisablePage,
//       showUnselectedLabels: true,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.checklist_sharp,
//             size: 30,
//           ),
//           label: 'Hoje',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.emoji_events,
//             size: 30,
//           ),
//           label: 'Hábitos',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.check_circle_outline,
//             size: 30,
//           ),
//           label: 'Tarefas',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.widgets_outlined,
//             size: 30,
//           ),
//           label: 'Categorias',
//         ),
//       ],
//       currentIndex: selectedIndex,
//       selectedItemColor: AppColors.iconActivePage,
//       onTap: _onitemTapped,
//     );
//   }
// }
