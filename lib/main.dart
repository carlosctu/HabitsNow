import 'package:flutter/material.dart';
import 'presenter/home/task/model/task_model.dart';
import 'presenter/home/task/provider/task_provider.dart';
import 'presenter/home/task/task.dart';
import 'presenter/home/task/widgets/task_list_widget.dart';
import 'presenter/core/colors.dart';
import 'presenter/home/habits/state/provider/habits_provider.dart';
import 'presenter/home/sidebar/widgets/alex_box_rateourapp.dart';

import 'presenter/home/home_page.dart';
import 'package:provider/provider.dart';

import 'presenter/home/sidebar/widgets/alert_box_bepremium.dart';
import 'presenter/home/sidebar/widgets/navigation_item.dart';
import 'presenter/home/sidebar/widgets/navigation_provider.dart';
import 'presenter/widgets/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NavigationProvider>(
        create: (context) => NavigationProvider(),
        child: TaskPage(),
      ),
      ChangeNotifierProvider<TaskProvider>(
        create: (context) => TaskProvider(),
      ),
      ChangeNotifierProvider<HabitsProvider>(
        create: (context) => HabitsProvider(),
      ),
    ],
    child: MaterialApp(
      color: AppColors.backgroundPage,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Main Page",
      home: const SplashPage(),
    ),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.home:
        return HomePage();
      case NavigationItem.categories:
        // Adicionar caminho para a Pag. Categorias
        return HomePage();
      case NavigationItem.customize:
        // Adicionar caminho para a Pag. Personalizar
        return HomePage();
      case NavigationItem.configurations:
        // Adicionar caminho para a Pag. Configurações
        return HomePage();
      case NavigationItem.becomePremium:
        return const BePremium();
      case NavigationItem.rateUs:
        return const RateOurApp();
      case NavigationItem.contactUs:
        return HomePage();
    }
  }
}
