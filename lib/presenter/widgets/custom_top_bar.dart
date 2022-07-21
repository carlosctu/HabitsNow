import 'package:flutter/material.dart';

import '../core/colors.dart';
import '../home/home_page.dart';

class CustomTopBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTopBar({
    Key? key,
    required this.title,
    this.simbol = const Text(""),
  }) : super(key: key);

  final String title;
  final Widget simbol;

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
  
  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}

class _CustomTopBarState extends State<CustomTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.iconActivePage),
      backgroundColor: AppColors.backgroundPage,
      title: Text(widget.title),
      actions: [
        Row(
          children: [
            widget.simbol,
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(), // puxar calendario full
                  ),
                );
              },
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.iconDisablePage,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
