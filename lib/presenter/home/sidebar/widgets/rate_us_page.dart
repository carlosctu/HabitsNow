import 'package:flutter/material.dart';
import '../navigation_drawer.dart';

class RateUs extends StatelessWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: const Text('Rate Us'),
        ),
        body: const Text('Rate Us'),
      );
}
