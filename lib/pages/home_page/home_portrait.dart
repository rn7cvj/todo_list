import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final List<Task> Tasks = [
    Task("Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task("Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task("Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task("Купить что-то 4", null, true, TaskImportanceTypes.Hight),
    Task("Купить что-то 5", DateTime.now(), false, TaskImportanceTypes.Hight),
    Task("Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task("Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task("Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task("Купить что-то 4", null, true, TaskImportanceTypes.Hight),
    Task("Купить что-то 5", DateTime.now(), false, TaskImportanceTypes.Hight),
    Task("Купить что-то 1", null, false, TaskImportanceTypes.Not),
    Task("Купить что-то 2", DateTime.now(), true, TaskImportanceTypes.Low),
    Task("Купить что-то 3", null, false, TaskImportanceTypes.Low),
    Task("Купить что-то 4", null, true, TaskImportanceTypes.Hight),
    Task("Купить что-то 5", DateTime.now(), false, TaskImportanceTypes.Hight),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.my_task),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: buildMainContent(context)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    List<Widget> taskTiles = [];

    if (Tasks.isNotEmpty) {
      // ignore: unnecessary_cast
      taskTiles.add(TaskTile(task: Tasks.first, isFirst: true) as Widget);
    }

    // Тут нужен этот каст иначе не получается добавить кнопку новое которая внизу
    // ignore: unnecessary_cast
    taskTiles.addAll(Tasks.sublist(1).map((task) => TaskTile(
          task: task,
          isFirst: false,
        ) as Widget));

    taskTiles.add(buildAddNewTaskButton(context));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appRoundRadiusMedium)),
      margin: const EdgeInsets.all(appMargingMedium),
      child: Column(children: taskTiles),
    );
  }

  Widget buildAddNewTaskButton(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(appRoundRadiusMedium),
        bottomRight: Radius.circular(appRoundRadiusMedium),
      ),
      onTap: () {},
      child: Container(
        // 56 - это размеры чек бокса, почему не спрашивайте
        padding: const EdgeInsets.only(
          left: 56,
          top: appElevationMedium,
          bottom: appElevationMedium + appPaddingSmall,
        ),
        color: Colors.transparent,
        width: double.infinity,
        child: Text(t.common.add_new),
      ),
    );
  }
}
