import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'widgets/task_list_widget.dart';
import '../../widgets/custom_img_cont.dart';

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
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomTopBar(title: 'Tarefas'),
        drawer: const NavigationDrawer(),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                controller: _colorController,
                indicatorColor: AppColors.iconActivePage,
                labelColor: Colors.white,
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
              const Center(child: CustomImgCont()),
              const SizedBox(
                height: 10,
              ),
              const TaskListWidget(),
            ],
          ),
        ),
      );
}
