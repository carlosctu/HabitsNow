import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/habits/widgets/recurring_tasks_modal.dart';
import 'package:habits_now_app/presenter/home/habits/widgets/tasks_modal.dart';

import 'habit_modal.dart';

class ShowModalButton extends StatelessWidget {
  const ShowModalButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet<void>(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
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
        backgroundColor: Color.fromARGB(255, 158, 13, 59),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
