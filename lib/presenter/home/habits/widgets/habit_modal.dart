import 'package:flutter/material.dart';

import '../state/add_habits_dialog.dart';

class HabitModal extends StatelessWidget {
  const HabitModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AddHabitsDialog();
              },
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(23, 255, 7, 61),
                  child: Icon(
                    Icons.emoji_events_outlined,
                    color: Color.fromARGB(255, 188, 31, 70),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Habito',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Atividade que se repete ao longo do tempo. Pussui rastreamento detalhado e estatisticas.',
                        style: TextStyle(
                            color: Color.fromARGB(255, 148, 148, 148),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(255, 148, 148, 148),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
