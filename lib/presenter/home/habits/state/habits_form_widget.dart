import 'package:flutter/material.dart';

class HabitsFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onDescriptionChanged;
  final VoidCallback onSaveTask;

  const HabitsFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onTitleChanged,
    required this.onDescriptionChanged,
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
            return 'O campo "Hábito" não pode estar vazio!';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Hábito',
        ),
      );

  Widget buildDescription() => TextFormField(
        initialValue: description,
        onChanged: onDescriptionChanged,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Descrição do hábito',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSaveTask,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: const Text('Salvar Hábito'),
        ),
      );
}
