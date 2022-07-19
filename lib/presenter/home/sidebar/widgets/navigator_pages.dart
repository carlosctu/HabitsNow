import 'package:flutter/material.dart';
import 'alert_box_bepremium.dart';
import 'alex_box_rateourapp.dart';
import '../../home_page.dart';
import 'configuration_page.dart';
import 'package:provider/provider.dart';
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
        return const BePremium();
      case NavigationItem.rateUs:
        return const RateOurApp();
      case NavigationItem.contactUs:
        return const HomePage();
    }
  }
}
