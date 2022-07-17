import 'package:flutter/material.dart';

import '../sidebar.dart';

class RateAppPage extends StatelessWidget {
  const RateAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Our App'),
      ),
      drawer: const SideBar(),
    );
  }
}
