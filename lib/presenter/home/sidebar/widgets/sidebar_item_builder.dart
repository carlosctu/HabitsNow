import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_item.dart';
import 'navigation_provider.dart';

Widget buildSideBarItem(BuildContext context,
    {required NavigationItem item,
    required String text,
    required IconData icon,
    required VoidCallback onClicked}) {
  final provider = Provider.of<NavigationProvider>(context);
  final currentItem = provider.navigationItem;
  final isSelected = item == currentItem;
  final color =
      isSelected ? const Color.fromARGB(255, 213, 32, 89) : Colors.white70;

  return Material(
    color: Colors.transparent,
    child: ListTile(
      selected: isSelected,
      selectedTileColor: const Color.fromARGB(50, 213, 32, 89),
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 18,
        ),
      ),
      // ignore: avoid_print
      onTap: () {
        selectItem(context, item);
        onClicked();
      },
    ),
  );
}

void selectItem(BuildContext context, NavigationItem item) {
  final provider = Provider.of<NavigationProvider>(context, listen: false);
  provider.setNavigationItem(item);
}
