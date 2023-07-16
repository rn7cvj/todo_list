import 'package:flutter/material.dart';
import 'package:todo_list/pages/edit_task_page/edit_task_portrait.dart';

import '../../constants.dart';

class EditTaslLandscape extends StatelessWidget {
  const EditTaslLandscape({super.key, required this.taskUid});

  final String taskUid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Card(
            elevation: appElevationMedium,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(appRoundRadiusMedium)),
              child: EditTaskPortait(
                taskUid: taskUid,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
