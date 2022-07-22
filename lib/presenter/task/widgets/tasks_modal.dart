import 'package:flutter/material.dart';

import '../../task/widgets/add_task_dialog.dart';

class TaskModal extends StatelessWidget {
  const TaskModal({
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
                return const AddTaskDialog();
              },
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(23, 255, 7, 61),
                  child: Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 188, 31, 70),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Tarefas',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Atividade única sem rastreamento ao longo do tempo.',
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
