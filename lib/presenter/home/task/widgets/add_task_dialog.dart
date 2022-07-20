import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_model.dart';
import '../provider/task_provider.dart';
import 'task_form_widget.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

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
              'Adicione uma tarefa!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(height: 8),
            TaskFormWidget(
              onTitleChanged: (title) => setState(() => this.title = title),
              onDescriptionChanged: (description) =>
                  setState(() => this.description = description),
              onSaveTask: saveTask,
            )
          ],
        ),
      ),
    );
  }

  void saveTask() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final task = Task(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TaskProvider>(context, listen: false);
      provider.addTask(task);

      Navigator.of(context).pop();
    }
  }
}
