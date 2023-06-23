import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/constants.dart';

import '../../../controlles/task_list.dart';
import '../../../i18n/strings.g.dart';

// Это должен быть StateLess виджет но форматер ругается на не файнал поле
// поэтоу это Stateful )))
class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TaskListContoller contoller = GetIt.I<TaskListContoller>();

  final Observable<double> appBarExpendProgress = Observable<double>(0.0);

  late double screenFourth;

  void scrollContollerListenet() => runInAction(() {
        appBarExpendProgress.value = min(widget.scrollController.offset, screenFourth) / screenFourth;
      });

  @override
  Widget build(BuildContext context) {
    screenFourth = MediaQuery.sizeOf(context).height / 4;
    widget.scrollController.addListener(scrollContollerListenet);

    return Observer(
      builder: (context) {
        // 72 , 16 - значенния по умолчанию решил из оставить
        // 4 - добавил чтобы оно было на одном уровне у текстом (подбирал на глаз )
        // 56 тут просто так, вроде как много отступов кратно 8
        EdgeInsetsDirectional titlePadding = EdgeInsetsDirectional.only(
          start: 72 + 4 - lerpDouble(0, 56, appBarExpendProgress.value)!,
          // 24 - чтобы оно не наезжало на backround потому что IconButton имеет какие-то свои отступы
          bottom: 16 + lerpDouble(24, 0, appBarExpendProgress.value)!,
        );

        return SliverAppBar(
          shadowColor: Theme.of(context).colorScheme.shadow,
          pinned: true,
          expandedHeight: screenFourth,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: titlePadding,
            title: Text(
              t.home.my_task,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            background: buildBackround(context),
            collapseMode: CollapseMode.pin,
          ),
        );
      },
    );
  }

  Widget buildBackround(BuildContext context) {
    return Observer(
      builder: (context) {
        double complitedTextOpacity = lerpDouble(0.8, 0, appBarExpendProgress.value)!;

        EdgeInsets backroundPadding =
            EdgeInsets.only(left: 72 + 4 + lerpDouble(0, 56, appBarExpendProgress.value)!, right: appPaddingSmall);

        IconData visibilityToogleIcon = contoller.isComplitedTaskVisible ? Icons.visibility : Icons.visibility_off;

        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            // 72 + 4 - чтобы было на одном уровне с заголовком
            padding: backroundPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${t.home.complited} - ${contoller.complitedTaskCount}",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary.withOpacity(complitedTextOpacity)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: appElevationSmall),
                  child: IconButton(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(complitedTextOpacity),
                    onPressed: contoller.toogleComplitedTaskVisibilty,
                    icon: Icon(visibilityToogleIcon),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
