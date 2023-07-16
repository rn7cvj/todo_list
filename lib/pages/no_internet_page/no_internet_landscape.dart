import 'package:flutter/material.dart';
import 'package:todo_list/pages/internet_check_page/internet_check_portrait.dart';
import 'package:todo_list/pages/no_internet_page/no_internet_portrait.dart';

import '../../constants.dart';

class NoInternetLandscape extends StatelessWidget {
  const NoInternetLandscape({super.key});

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
              child: NoInternetPortrait(),
            ),
          ),
        ),
      ),
    );
  }
}
