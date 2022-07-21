import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
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
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              // children: [
              // Switch(
              //   value: isImportant ?? false,
              //   onChanged: onChangedImportant,
              // ),
              // Expanded(
              //   child: Slider(
              //     value: (number ?? 0).toDouble(),
              //     min: 0,
              //     max: 3,
              //     divisions: 5,
              //     onChanged: (number) => onChangedNumber(number.toInt()),
              //   ),
              // )
              // ],
              // ),
              // buildTitle(),
              const SizedBox(height: 32),
              buildDescription(),
              // const SizedBox(height: 8),
            ],
          ),
        ),
      );

  // Widget buildTitle() => TextFormField(
  //       maxLines: 1,
  //       initialValue: "title",
  //       style: const TextStyle(
  //         color: Colors.white70,
  //         fontSize: 16.5,
  //       ),
  //       decoration: const InputDecoration(
  //         border: InputBorder.none,
  //         hintText: 'Seu nome',
  //         hintStyle: TextStyle(color: Colors.white70),
  //       ),
  //       validator: (title) =>
  //           title != null && title.isEmpty ? 'Nome não pode estar vazio' : null,
  //       onChanged: onChangedTitle,
  //     );

  Widget buildDescription() => TextFormField(
        // maxLines: 2,
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
