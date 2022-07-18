import 'package:flutter/material.dart';

import '../../widgets/customBottomBar.dart';
import '../sidebar/navigation_drawer.dart';

class HabitsPage extends StatefulWidget {

  const HabitsPage({ Key? key }) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text("Habits"),
      ),
      body: Text('Habits'),
      drawer: const NavigationDrawer(),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}