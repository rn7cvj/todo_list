import 'package:flutter/material.dart';

import 'edit_task_portrait.dart';

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.taskId});

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return EditTaskPortait(
      taskId: taskId,
    );
  }
}
