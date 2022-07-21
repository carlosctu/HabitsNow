import 'package:flutter/material.dart';

import 'habit_modal.dart';
import 'recurring_tasks_modal.dart';
import 'tasks_modal.dart';

class ShowModalButton extends StatelessWidget {
  const ShowModalButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      onPressed: () {
        showModalBottomSheet<void>(
          backgroundColor: const Color.fromARGB(255, 20, 20, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          context: context,
          builder: (BuildContext context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 10),
                HabitModal(),
                RecurringTaskModal(),
                TaskModal(),
                SizedBox(height: 10),
              ],
            );
          },
        );
      },
      child: const CircleAvatar(
        radius: 30,
        backgroundColor: Color.fromARGB(255, 158, 13, 59),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
