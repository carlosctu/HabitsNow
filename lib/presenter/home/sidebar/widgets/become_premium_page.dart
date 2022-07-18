import 'package:flutter/material.dart';

import '../navigation_drawer.dart';

class BecomePremium extends StatelessWidget {
  const BecomePremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Become Premium'),
        ),
        body: const Text('Become Premium'),
      );
}
