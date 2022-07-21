import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'habits_form_widget.dart';
import 'model/habits_model.dart';
import 'provider/habits_provider.dart';

class AddHabitsDialog extends StatefulWidget {
  const AddHabitsDialog({Key? key}) : super(key: key);

  @override
  State<AddHabitsDialog> createState() => _AddHabitsDialogState();
}

class _AddHabitsDialogState extends State<AddHabitsDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  String calendarTime = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adicione um hábito!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            HabitsFormWidget(
              onTitleChanged: (title) => setState(() => this.title = title),
              onDescriptionChanged: (description) =>
                  setState(() => this.description = description),
              onCalendarChanged: (calendarTime) =>
                  setState(() => this.calendarTime = calendarTime),
              onSaveTask: saveHabits,
            )
          ],
        ),
      ),
    );
  }

  void saveHabits() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habits = Habits(
          id: DateTime.now().toString(),
          title: title,
          description: description,
          createdTime: DateTime.now(),
          calendar: calendarTime);

      final provider = Provider.of<HabitsProvider>(context, listen: false);
      provider.addHabits(habits);

      Navigator.of(context).pop();
    }
  }
}
