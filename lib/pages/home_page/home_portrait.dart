import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/home.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  // final contoller = HomeController();

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
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Widget buildMainContent(BuildContext context) {
    // List<Task> tasks = contoller.tasks;
    List<Task> tasks = [];

    List<Widget> taskTiles = [];

    if (tasks.isNotEmpty) {
      // ignore: unnecessary_cast
      taskTiles.add(TaskTile(task: tasks.first, isFirst: true) as Widget);
    }

    // Тут нужен этот каст иначе не получается добавить кнопку новое которая внизу
    // ignore: unnecessary_cast
    taskTiles.addAll(tasks.sublist(1).map((task) => TaskTile(
          task: task,
          isFirst: false,
        ) as Widget));

    taskTiles.add(buildAddNewTaskButton(context, tasks.isEmpty));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(appRoundRadiusMedium)),
      margin: const EdgeInsets.all(appMargingMedium),
      child: Column(children: taskTiles),
    );
  }

  Widget buildAddNewTaskButton(BuildContext context, bool isTasksListEmpty) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: isTasksListEmpty
            ? BorderRadius.circular(appRoundRadiusMedium)
            : const BorderRadius.only(
                bottomLeft: Radius.circular(appElevationMedium),
                bottomRight: Radius.circular(appElevationMedium),
              ),
      ),
      onTap: () {},
      title: Text(t.common.add_new),
      leading: Icon(Icons.add),
    );
  }

  Widget buildAddNewTaskButtonInkWell(BuildContext context) {
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
