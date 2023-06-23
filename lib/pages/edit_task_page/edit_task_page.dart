import 'package:flutter/material.dart';

import 'edit_task_portrait.dart';

//Здесь предполагается переключение между десктопной/ и мобильной версиями
class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return EditTaskPortait(
      taskUid: taskId,
    );
  }
}
