import 'package:flutter/material.dart';

class RateUsForm extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const RateUsForm({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 28),
              buildDescription(),
              // const SizedBox(height: 8),
            ],
          ),
        ),
      );

  Widget buildDescription() => TextFormField(
        initialValue: description,
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 16,
        ),
        decoration: const InputDecoration(
          hintText: 'Escreva seu comentário aqui',
          hintStyle: TextStyle(color: Colors.white60),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 213, 32, 89),
            ),
          ),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'Campo não pode estar vazio'
            : null,
        onChanged: onChangedDescription,
      );
}
