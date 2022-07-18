import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/navigation_item.dart';
import 'widgets/navigation_provider.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "HabitNow",
                          style: TextStyle(
                            color: Color.fromARGB(255, 213, 32, 89),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Quarta-feira",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "13 de julho de 2022",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.home,
                    text: 'Início',
                    icon: Icons.home_outlined,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.categories,
                    text: 'Categorias',
                    icon: Icons.category_outlined,
                  ),
                  const Divider(
                    height: 40,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.customize,
                    text: 'Personalizar',
                    icon: Icons.color_lens_outlined,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.configurations,
                    text: 'Configurações',
                    icon: Icons.tune_outlined,
                  ),
                  const Divider(
                    height: 30,
                    color: Colors.white70,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.becomePremium,
                    text: 'Obtenha Premium',
                    icon: Icons.verified_outlined,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.rateUs,
                    text: 'Avalie o aplicativo',
                    icon: Icons.rate_review,
                  ),
                  buildSideBarItem(
                    context,
                    item: NavigationItem.contactUs,
                    text: 'Contate-nos',
                    icon: Icons.report_outlined,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildSideBarItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
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
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
}
