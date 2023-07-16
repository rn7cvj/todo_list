import 'package:flutter/material.dart';
import 'package:todo_list/pages/internet_check_page/internet_check_portrait.dart';

import '../../constants.dart';

class InternetCheckLandscape extends StatelessWidget {
  const InternetCheckLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Card(
            elevation: appElevationMedium,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(appRoundRadiusMedium)),
              child: InternetCheckPortait(),
            ),
          ),
        ),
      ),
    );
  }
}
