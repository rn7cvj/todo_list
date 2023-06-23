import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../modals/task.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = [];

    //Добавляем один виджет со скруглениями сверху
    if (tasks.isNotEmpty) {
      // ignore: unnecessary_cast
      tiles.add(TaskTile(task: tasks.first, isFirst: true) as Widget);
    }

    if (tasks.length > 1) {
      // Тут нужен этот каст иначе не получается добавить кнопку новое которая внизу
      // ignore: unnecessary_cast
      tiles.addAll(tasks.sublist(1).map((task) => TaskTile(
            task: task,
            isFirst: false,
          ) as Widget));
    }

    if (tasks.isNotEmpty) {
      tiles.add(const Divider(
        indent: appPaddingMedium,
        endIndent: appPaddingMedium,
        height: 0,
      ));
    }

    //Согласно заветам тз "Анимации не ожидаем."
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: animationDurationFast,
      child: Column(
        children: tiles,
      ),
    );
  }
}
