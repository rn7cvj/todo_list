import 'package:flutter/material.dart';
import 'package:todo_list/pages/add_task_page/add_task_portrait.dart';

import '../../constants.dart';

//Временно (наверное) неиспользуемая заглушка
class AddTaskLandscape extends StatelessWidget {
  const AddTaskLandscape({super.key});

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
              child: AddTaskPortrait(),
            ),
          ),
        ),
      ),
    );
  }
}
