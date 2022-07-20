import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/core/colors.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/navigator_pages.dart';
import 'package:habits_now_app/presenter/widgets/customImgCont.dart';

import '../../widgets/custom_top_bar.dart';
import '../sidebar/navigation_drawer.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with TickerProviderStateMixin {
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
      appBar: const CustomTopBar(title: 'Tarefas'),
      drawer: const NavigationDrawer(),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                  'Tarefas Simples',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Tarefas Recorrentes',
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
          Center(child: CustomImgCont()),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Sem tarefas pendentes!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Você pode adicionar quantas quiser!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.iconActivePage,
        child: Icon(Icons.add),
        onPressed: () => print('Fui clicado'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
