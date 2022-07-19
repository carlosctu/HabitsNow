import 'package:flutter/material.dart';
import 'presenter/core/colors.dart';
import 'presenter/home/calendar/calendar_page.dart';
import 'package:provider/provider.dart';
import 'presenter/home/sidebar/widgets/navigation_item.dart';
import 'presenter/home/sidebar/widgets/navigation_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MaterialApp(
      color: AppColors.backgroundPage,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: "Main Page",
      home: const MainPage(),
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
        return CalendarPage();
      case NavigationItem.categories:
        // Adicionar caminho para a Pag. Categorias
        return CalendarPage();
      case NavigationItem.customize:
        // Adicionar caminho para a Pag. Personalizar
        return CalendarPage();
      case NavigationItem.configurations:
        // Adicionar caminho para a Pag. Configurações
        return CalendarPage();
      case NavigationItem.becomePremium:
        return CalendarPage();
      case NavigationItem.rateUs:
        return CalendarPage();
      case NavigationItem.contactUs:
        return CalendarPage();
    }
  }
}
