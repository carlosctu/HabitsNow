import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/configuration_page.dart';
import 'package:provider/provider.dart';
import '../../homepage/home_page.dart';
import 'navigation_item.dart';
import 'navigation_provider.dart';

class NavigatorPages extends StatefulWidget {
  const NavigatorPages({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NavigatorPagesState createState() => _NavigatorPagesState();
}

class _NavigatorPagesState extends State<NavigatorPages> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.home:
        return const HomePage();
      case NavigationItem.categories:
        // Adicionar caminho para a Pag. Categorias
        return const HomePage();
      case NavigationItem.customize:
        // Adicionar caminho para a Pag. Personalizar
        return const HomePage();
      case NavigationItem.configurations:
        // Adicionar caminho para a Pag. Configurações
        return const ConfigurationPage();
      case NavigationItem.becomePremium:
        return const HomePage();
      case NavigationItem.rateUs:
        return const HomePage();
      case NavigationItem.contactUs:
        return const HomePage();
    }
  }
}
