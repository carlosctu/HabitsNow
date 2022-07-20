import 'package:flutter/material.dart';
import 'package:habits_now_app/presenter/home/task/widgets/task_widget.dart';
import 'package:provider/provider.dart';

import '../provider/task_provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? Column(
            children: const [
              Text(
                'Sem tarefas pendentes!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Você pode adicionar quantas quiser!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(
              height: 8,
            ),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskWidget(task: task);
            },
          );
  }
}
