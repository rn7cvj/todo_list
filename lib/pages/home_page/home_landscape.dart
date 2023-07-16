import 'package:flutter/material.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/pages/home_page/home_portrait.dart';

//Временно (наверное) неиспользуемая заглушка
class HomeLandscape extends StatelessWidget {
  const HomeLandscape({super.key});

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
              child: HomePortrait(),
            ),
          ),
        ),
      ),
    );
  }
}
