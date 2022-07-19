import 'package:flutter/material.dart';
import '../navigation_drawer.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: const Text('Contact Us'),
        ),
        body: const Text('Contact Us'),
      );
}
