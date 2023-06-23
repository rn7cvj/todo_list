import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../constants.dart';
import '../../../i18n/strings.g.dart';
import '../../../navigator.dart';

class NewTaskButton extends StatelessWidget {
  NewTaskButton({
    super.key,
    required this.isTasksListEmpty,
  });

  final NavigationManager navigationManager = GetIt.I<NavigationManager>();

  final bool isTasksListEmpty;

  @override
  Widget build(BuildContext context) {
    ShapeBorder shape = RoundedRectangleBorder(
      borderRadius: isTasksListEmpty
          ? BorderRadius.circular(appRoundRadiusMedium)
          : const BorderRadius.only(
              bottomLeft: Radius.circular(appElevationMedium),
              bottomRight: Radius.circular(appElevationMedium),
            ),
    );

    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: appPaddingSmall,
        right: appPaddingSmall,
      ),
      shape: shape,
      onTap: navigationManager.openAddTaskPage,
      title: Text(t.common.add_new),
      // Чтобы плючик был на уровне с чебоксами подвибрал на глаз
      // (Авторская орфография сохранена)
      leading: const Padding(
        padding: EdgeInsets.all(13),
        child: Icon(Icons.add),
      ),
    );
  }
}
