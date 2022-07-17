import 'package:flutter/material.dart';
import 'widgets/build_sidebar_item.dart';
import 'widgets/navigation_sidebar.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Material(
        color: const Color.fromARGB(255, 22, 22, 22),
        child: ListView(
          children: [
            buildSideBarItem(
                text: 'Inicio',
                icon: Icons.home_outlined,
                onClicked: () => selectedItem(context, 0)),
            buildSideBarItem(
                text: 'Categorias',
                icon: Icons.category_outlined,
                onClicked: () => selectedItem(context, 1)),
            const SideDivider(),
            buildSideBarItem(
                text: 'Personalizar',
                icon: Icons.color_lens_outlined,
                onClicked: () => selectedItem(context, 2)),
            buildSideBarItem(
                text: 'Configurações',
                icon: Icons.tune,
                onClicked: () => selectedItem(context, 3)),
            const SideDivider(),
            buildSideBarItem(
                text: 'Obtenha premium',
                icon: Icons.verified,
                onClicked: () => selectedItem(context, 4)),
            buildSideBarItem(
                text: 'Avalie nosso aplicativo',
                icon: Icons.star,
                onClicked: () => selectedItem(context, 5)),
            buildSideBarItem(
                text: 'Contate-nos',
                icon: Icons.report_gmailerrorred,
                onClicked: () => selectedItem(context, 6)),
          ],
        ),
      ),
    );
  }
}

class SideDivider extends StatelessWidget {
  const SideDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.white10,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
