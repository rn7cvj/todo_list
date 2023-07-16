import 'package:flutter/material.dart';
import 'package:todo_list/pages/settings_page/settings_portrait.dart';

import '../../constants.dart';

class SettingsLandscape extends StatelessWidget {
  const SettingsLandscape({super.key});

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
              child: SettingsPortrait(),
            ),
          ),
        ),
      ),
    );
  }
}
