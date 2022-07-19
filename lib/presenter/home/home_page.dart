import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/bottombar/bottom_nav_bar.dart';
import '../core/colors.dart';
import '../widgets/custom_top_bar.dart';
import 'sidebar/navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: CustomTopBar(title:"Home Page"),
      drawer: NavigationDrawer(),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
