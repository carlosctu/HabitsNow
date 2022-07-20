import 'package:flutter/material.dart';

import '../../../widgets/custom_top_bar.dart';
import '../navigation_drawer.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: const CustomTopBar(title: 'Contate-nos'),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: const Text('Contact Us'),
      );
}
