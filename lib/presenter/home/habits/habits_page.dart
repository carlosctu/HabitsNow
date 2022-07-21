import 'package:flutter/material.dart';
import 'widgets/show_modal_button.dart';
import '../../widgets/custom_top_bar.dart';

import '../../core/colors.dart';
import '../../widgets/customImgCont.dart';
import '../sidebar/navigation_drawer.dart';
import 'state/habits_list_widget.dart';

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
                      'Hábitos Ativos',
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
              const HabitsListWidget(),
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
