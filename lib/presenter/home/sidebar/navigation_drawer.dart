import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/navigation_item.dart';
import 'widgets/navigation_provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'widgets/rate_us_page.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;
  late DateFormat dayFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('pt_BR');
    dayFormat = DateFormat.EEEE('pt_BR');
  }

  var dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) => Drawer(
        width: MediaQuery.of(context).size.width / 1.4,
        child: Container(
          color: const Color.fromARGB(255, 22, 22, 22),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "HabitsNow",
                          style: TextStyle(
                            color: Color.fromARGB(255, 213, 32, 89),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dayFormat.format(dateTime),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dateFormat.format(dateTime),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  buildSideBarItem(context,
                      item: NavigationItem.home,
                      text: 'Início',
                      icon: Icons.home_outlined,
                      onClicked: () {}),
                  buildSideBarItem(context,
                      item: NavigationItem.categories,
                      text: 'Categorias',
                      icon: Icons.category_outlined,
                      onClicked: () {}),
                  const Divider(
                    height: 40,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(context,
                      item: NavigationItem.customize,
                      text: 'Personalizar',
                      icon: Icons.color_lens_outlined,
                      onClicked: () {}),
                  buildSideBarItem(context,
                      item: NavigationItem.configurations,
                      text: 'Configurações',
                      icon: Icons.tune_outlined,
                      onClicked: () {}),
                  const Divider(
                    height: 30,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(context,
                      item: NavigationItem.becomePremium,
                      text: 'Obtenha Premium',
                      icon: Icons.verified_outlined,
                      onClicked: () {}),
                  buildSideBarItem(context,
                      item: NavigationItem.rateUs,
                      text: 'Avalie o aplicativo',
                      icon: Icons.rate_review,
                      // ignore: avoid_print
                      onClicked: () {
                    ReportBug alert = const ReportBug();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }),
                  buildSideBarItem(context,
                      item: NavigationItem.contactUs,
                      text: 'Contate-nos',
                      icon: Icons.report_outlined,
                      onClicked: () {}),
                ],
              ),
            ],
          ),
        ),
      );

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
}

class ReportBug extends StatelessWidget {
  const ReportBug({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      title: Column(
        children: [
          const Text(
            'Reportar bug',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
          Container(
            height: 15,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white10,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Wrap(
          children: [
            Column(
              children: [
                const Text(
                  'Escreva o seu comentário aqui',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: const Color.fromARGB(255, 213, 32, 89),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 32, 89),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CANCELAR',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'ENVIAR',
                style: TextStyle(
                    color: Color.fromARGB(255, 213, 32, 89),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
