import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/task_list.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';
import '../../navigator.dart';
import 'widgets/home_appbar.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final TaskListContoller contoller = GetIt.I<TaskListContoller>();
  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          HomeAppBar(scrollController: scrollController),
          SliverToBoxAdapter(
            child: Observer(
              builder: (context) => buildTaskList(context, contoller.getTasks),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigationManager.openAddTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskList(BuildContext context, List<Task> tasks) {
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
      onTap: navigationManager.openAddTask,
      title: Text(t.common.add_new),
      leading: const Icon(Icons.add),
    );
  }
}
