import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/habits/widgets/show_modal_button.dart';
import 'package:habits_now_app/presenter/widgets/custom_top_bar.dart';

import '../../core/colors.dart';
import '../../widgets/customImgCont.dart';
import '../sidebar/navigation_drawer.dart';

class HabitsPage extends StatefulWidget {
  const HabitsPage({Key? key}) : super(key: key);

  @override
  State<HabitsPage> createState() => _HabitsPageState();
}

class _HabitsPageState extends State<HabitsPage> with TickerProviderStateMixin {
  late TabController _colorController;

  @override
  void initState() {
    super.initState();
    _colorController = TabController(length: 2, vsync: this);
    _colorController.addListener(_selectedTable);
  }

  void _selectedTable() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTopBar(title: 'Hábitos'),
      drawer: const NavigationDrawer(),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          TabBar(
            controller: _colorController,
            indicatorColor: AppColors.iconActivePage,
            labelColor: Colors.white,
            // unselectedLabelColor: Colors.black,
            tabs: const [
              Tab(
                child: Text(
                  'Hábitos ativos',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Arquivados',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: CustomImgCont(
            assetPath: 'assets/img/habits.jpg',
          )),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Sem hábitos ativos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'É um bom dia para começar uma mudança ^.^',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      // floatingActionButton: ShowModalButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
