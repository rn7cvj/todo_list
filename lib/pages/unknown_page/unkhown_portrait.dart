import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';

import '../../i18n/strings.g.dart';
import '../../navigation/router_delegate.dart';

class UnknownPagePortrait extends StatelessWidget {
  UnknownPagePortrait({super.key});

  final IRouter navigationManager = GetIt.I<IRouter>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPaddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  t.unknown.oops,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingLarge),
              child: ElevatedButton(
                onPressed: navigationManager.popToHomePage,
                child: Text(t.unknown.back_to_home),
              ),
            )
          ],
        ),
      ),
    );
  }
}
