import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../bottombar/bottom_nav_bar.dart';
import '../sidebar/widgets/navigator_pages.dart';
import 'provider/task_provider.dart';
import 'widgets/add_task_dialog.dart';
import 'widgets/task_list_widget.dart';
import '../../widgets/customImgCont.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_top_bar.dart';
import '../sidebar/navigation_drawer.dart';
import 'model/task_model.dart';
import 'widgets/task_widget.dart';

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
              const TaskListWidget(),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.iconActivePage,
        //   child: Icon(Icons.add),
        //   onPressed: () => showDialog(
        //     context: context,
        //     builder: (context) {
        //       return AddTaskDialog();
        //     },
        //   ),
        // ),
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.centerDocked,
      );
}
