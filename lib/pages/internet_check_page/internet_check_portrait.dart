import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer_effect/shimmer_effect.dart';

import '../../i18n/strings.g.dart';
import '../../logger.dart';

class InternetCheckPortait extends StatelessWidget {
  const InternetCheckPortait({super.key});

  @override
  Widget build(BuildContext context) {
    logger.i("Build InternetCheckPortait");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LoadingAnimationWidget.prograssiveDots(
              color: Theme.of(context).colorScheme.secondary,
              size: 100,
            ),
          ),
          ShimmerEffect(
            baseColor: Theme.of(context).colorScheme.secondary,
            highlightColor: Theme.of(context).colorScheme.onSecondary,
            child: Text(
              t.common.syncing,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          )
        ],
      ),
    );
  }
}
