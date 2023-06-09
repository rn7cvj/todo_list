import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';

import '../../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, required this.isFirst});

  final Task task;

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Dismissible(
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.4,
          DismissDirection.endToStart: 0.4,
        },
        key: UniqueKey(),
        background: buildBackground(context, DismissDirection.startToEnd),
        secondaryBackground: buildBackground(context, DismissDirection.endToStart),
        child: builTaskTile(context),
      ),
    );
  }

  Widget buildBackground(BuildContext context, DismissDirection dismissDirection) {
    Color backgroundColor = dismissDirection == DismissDirection.startToEnd
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.error;

    Alignment iconAligment =
        dismissDirection == DismissDirection.startToEnd ? Alignment.centerLeft : Alignment.centerRight;

    IconData iconData = dismissDirection == DismissDirection.startToEnd ? Icons.check : Icons.delete;

    EdgeInsets iconPadding = dismissDirection == DismissDirection.startToEnd
        ? const EdgeInsets.only(left: appPaddingLarge)
        : const EdgeInsets.only(right: appPaddingLarge);

    return Container(
      decoration: BoxDecoration(
        borderRadius: isFirst
            ? const BorderRadius.only(
                topLeft: Radius.circular(appRoundRadiusMedium),
                topRight: Radius.circular(appRoundRadiusMedium),
              )
            : null,
        color: backgroundColor,
      ),
      width: double.infinity,
      child: Align(
        alignment: iconAligment,
        child: Padding(
          padding: iconPadding,
          child: Icon(
            iconData,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
      ),
    );
  }

  Widget builTaskTile(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: isFirst ? appElevationSmall : 0.0),
      color: Colors.transparent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: appPaddingSmall),
            child: Checkbox(value: task.isComplited, onChanged: (newVAlue) {}),
          ),
          Builder(builder: (context) {
            if (task.ImportanceType == TaskImportanceTypes.Hight) {
              return Padding(
                padding: const EdgeInsets.only(right: appPaddingSmall),
                child: Text(
                  "!!",
                  style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              );
            }

            return Container();
          }),
          Expanded(
            child: Text(
              task.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: appPaddingSmall),
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
