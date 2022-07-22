import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../home_page.dart';
import 'widgets/list_view_buider.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundPage,
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color.fromARGB(255, 213, 32, 89),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: const ListViewBuilder(),
      backgroundColor: AppColors.backgroundPage,
    );
  }
}

