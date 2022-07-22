import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/provider/habits_provider.dart';
import 'habits_widget.dart';


class HabitsListWidget extends StatelessWidget {
  const HabitsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HabitsProvider>(context);
    final habits = provider.habits;

    return habits.isEmpty
        ? Column(
            children: const [
              Text(
                'Sem hábitos ativos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'É um bom dia para começar uma mudança ^.^',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            shrinkWrap: true,
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];

              return HabitsWidget(habits: habit);
            },
          );
  }
}
