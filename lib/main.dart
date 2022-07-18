import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'presenter/home/home_page.dart';
=======
import 'package:habits_now_app/presenter/home/home_page.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/become_premium_page.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/contact_us_page.dart';
import 'package:habits_now_app/presenter/home/sidebar/widgets/rate_us_page.dart';
import 'package:provider/provider.dart';
import 'presenter/home/sidebar/widgets/navigation_item.dart';
import 'presenter/home/sidebar/widgets/navigation_provider.dart';
>>>>>>> 70e5637ea864b3c2e5dd7605eeabbbce25165995

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Main Page",
      // theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainPage(),
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
        return const HomePage();
      case NavigationItem.categories:
        // Adicionar caminho para a Pag. Categorias
        return const HomePage();
      case NavigationItem.customize:
        // Adicionar caminho para a Pag. Personalizar
        return const HomePage();
      case NavigationItem.configurations:
        // Adicionar caminho para a Pag. Configurações
        return const HomePage();
      case NavigationItem.becomePremium:
        return const BecomePremium();
      case NavigationItem.rateUs:
        return const RateUs();
      case NavigationItem.contactUs:
        return const ContactUs();
    }
  }
}
