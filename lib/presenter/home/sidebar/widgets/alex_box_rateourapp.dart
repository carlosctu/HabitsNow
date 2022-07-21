import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/db/pages/notes_page.dart';

import 'configuration_page.dart';

class RateOurApp extends StatefulWidget {
  const RateOurApp({
    Key? key,
  }) : super(key: key);

  @override
  State<RateOurApp> createState() => _RateOurAppState();
}

class _RateOurAppState extends State<RateOurApp> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: const Color.fromARGB(255, 22, 22, 22),
      title: Column(
        children: [
          const Text(
            'Avalie nosso App!',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
          Container(
            height: 15,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white10,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Wrap(
          children: [
            Column(
              children: [
                const Text(
                  'Escreva o seu comentário aqui',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: myController,
                  cursorColor: const Color.fromARGB(255, 213, 32, 89),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 213, 32, 89),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
