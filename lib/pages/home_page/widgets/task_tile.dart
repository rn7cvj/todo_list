import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: builTaskTile(context),
      background: ,
    );
  }

  Widget builTaskTile(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.transparent,
      child: Center(child: Text(task.text)),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      color: Theme.of(context).colorScheme.error,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ),
    );
  }
}
