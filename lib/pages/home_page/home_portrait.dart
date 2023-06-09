import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home_page/widgets/task_tile.dart';

import '../../i18n/strings.g.dart';

class HomePortrait extends StatelessWidget {
  HomePortrait({super.key});

  final List<Task> Tasks = [
    Task("Купить что-то 1", null, false),
    Task("Купить что-то 2", null, true),
    Task("Купить что-то 3", null, false),
    Task("Купить что-то 4", null, false),
    // Task("Купить что-то 5", null, false),
    // Task("Купить что-то 6", null, false),
    // Task("Купить что-то 7", null, false),
    // Task("Купить что-то 8", null, false),
    // Task("Купить что-то 9", null, false),
    // Task("Купить что-то 10", null, false),
    // Task("Купить что-то 11", null, false),
    // Task("Купить что-то 12", null, false),
    // Task("Купить что-то 13", null, false),
    // Task("Купить что-то 14", null, false),
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
    List<Widget> taskTiles = Tasks.map((task) => TaskTile(task: task)).toList();

    // Так не работает я хз почему
    // taskTiles.add(buildAddNewTaskButton(context));

    return Card(
      margin: const EdgeInsets.all(appMargingMedium),
      child: Padding(
        padding: const EdgeInsets.all(appPaddingSmall),
        child: Column(children: taskTiles),
      ),
    );
  }

  Widget buildAddNewTaskButton(BuildContext context) {
    return InkResponse(
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.transparent,
        child: Center(child: Text(t.common.add_new)),
      ),
    );
  }
}
