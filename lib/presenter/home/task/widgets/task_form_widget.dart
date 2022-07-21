import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final String calendar;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onDescriptionChanged;
  final ValueChanged<String> onCalendarChanged;
  final VoidCallback onSaveTask;

  const TaskFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    this.calendar = '',
    required this.onTitleChanged,
    required this.onDescriptionChanged,
    required this.onCalendarChanged,
    required this.onSaveTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTitle(),
          const SizedBox(
            height: 8,
          ),
          buildDescription(),
          const SizedBox(
            height: 8,
          ),
          buildCalendar(),
          const SizedBox(
            height: 8,
          ),
          buildButton()
        ],
      ),
    );
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onTitleChanged,
        validator: (title) {
          if (title!.isEmpty) {
            return 'O campo "Tarefa" não pode estar vazio!';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Tarefa',
        ),
      );

  Widget buildDescription() => TextFormField(
        initialValue: description,
        onChanged: onDescriptionChanged,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Descrição da tarefa',
        ),
      );

  Widget buildCalendar() => TextFormField(
        initialValue: calendar,
        onChanged: onCalendarChanged,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Informe uma data',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSaveTask,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Text('Salvar Tarefa'),
        ),
      );
}
