import 'package:flutter/material.dart';
import '../database.dart';
import '../review.dart';
import 'rate_us_form.dart';
import '../pages/reviews_page.dart';

class RateUsAlexBox extends StatefulWidget {
  final Review? note;

  const RateUsAlexBox({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _RateUsAlexBoxState createState() => _RateUsAlexBoxState();
}

class _RateUsAlexBoxState extends State<RateUsAlexBox> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Wrap(
            children: [
              Column(
                children: [
                  const Text(
                    'Avalie nosso App!',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 15,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white12,
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: RateUsForm(
                      isImportant: isImportant,
                      number: number,
                      title: title,
                      description: description,
                      onChangedImportant: (isImportant) =>
                          setState(() => this.isImportant = isImportant),
                      onChangedNumber: (number) =>
                          setState(() => this.number = number),
                      onChangedTitle: (title) =>
                          setState(() => this.title = title),
                      onChangedDescription: (description) =>
                          setState(() => this.description = description),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 22, 22, 22),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
              buildButton(),
            ],
          ),
        ],
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;
    return SizedBox(
      width: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid
              ? const Color.fromARGB(255, 213, 32, 89)
              : const Color.fromARGB(255, 22, 22, 22),
        ),
        onPressed: addOrUpdateNote,
        child: const Text(
          'Enviar',
          style: TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await ReviewsDatabase.instance.updateReviews(note);
  }

  Future addNote() async {
    final note = Review(
      title: "Anonimo",
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await ReviewsDatabase.instance.create(note);
  }
}
