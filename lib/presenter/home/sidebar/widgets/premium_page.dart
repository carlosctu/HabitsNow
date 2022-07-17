import 'package:flutter/material.dart';

import '../sidebar.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become Premium'),
      ),
      drawer: const SideBar(),
    );
  }
}
