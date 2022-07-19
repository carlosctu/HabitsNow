import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/core/colors.dart';
import '../../calendar/calendar_page.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPage,
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 213, 32, 89),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarPage(),
              ),
            );
          },
        ),
      ),
      body: const ListViewBuilder(),
      backgroundColor: AppColors.backgroundPage,
    );
  }
}

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List<Icon> iconList = const [
    Icon(
      Icons.list,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
    Icon(
      Icons.notification_add_outlined,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
    Icon(
      Icons.color_lens_outlined,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
    Icon(
      Icons.lock_outline_rounded,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
    Icon(
      Icons.settings_backup_restore_outlined,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
    Icon(
      Icons.info_outline,
      color: Color.fromARGB(255, 213, 32, 89),
    ),
  ];
  List<String> nameList = [
    'Listas de tarefas e hábitos',
    'Notificações e Alarmes',
    'Personalizar',
    'PIN de desbloqueio',
    'Backup',
    'Licenciamento'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: ListView.builder(
        itemCount: iconList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              onTap: () {},
              leading: iconList[index],
              title: Text(
                nameList[index],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
