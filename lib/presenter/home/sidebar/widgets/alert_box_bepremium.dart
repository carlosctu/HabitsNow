
import 'package:flutter/material.dart';

class BePremium extends StatelessWidget {
  const BePremium({
    Key? key,
  }) : super(key: key);

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
            'Seja Premium!',
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
              children: const [
                Icon(
                  Icons.workspace_premium,
                  size: 38,
                  color: Color.fromARGB(255, 213, 32, 89),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Torne-se premium para desbloquear todos os recursos do nosso App.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              color: const Color.fromARGB(200, 213, 32, 89),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}