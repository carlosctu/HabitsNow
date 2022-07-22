import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/colors.dart';
import '../../../core/utils.dart';
import '../../calendar/events.dart';
import '../state/model/habits_model.dart';
import '../state/provider/habits_provider.dart';


class HabitsWidget extends StatelessWidget {
  final Habits habits;

  const HabitsWidget({
    Key? key,
    required this.habits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          key: Key(habits.id),
          actions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Deletar',
              onTap: () {
                deleteTask(context, habits);
              },
              icon: Icons.delete,
            )
          ],
          child: buildTask(context),
        ),
      );

  Widget buildTask(BuildContext context) {
    return Container(
      color: AppColors.title,
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  habits.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                if (habits.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      habits.description,
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    habits.calendar,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void deleteTask(BuildContext context, Habits task) {
    DateTime habitsDate = DateFormat.yMd("pt_BR").parseUTC(task.calendar);
    kEvents[habitsDate]!.remove(task.evento);

    final provider = Provider.of<HabitsProvider>(context, listen: false);

    provider.removeHabits(task);

    Utils.showSnackBar(context, 'Hábito deletado!');
  }
}
