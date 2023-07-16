import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';

import '../../i18n/strings.g.dart';
import '../../navigation/router_delegate.dart';

class NoInternetPortrait extends StatelessWidget {
  NoInternetPortrait({super.key});

  final IRouter navigationManager = GetIt.I<IRouter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPaddingMedium),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      t.nointernet.error_text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(appPaddingMedium),
                      child: Text(
                        t.nointernet.data_will_sync,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(appPaddingLarge),
                child: ElevatedButton(
                  onPressed: navigationManager.popToHomePage,
                  child: Text(t.nointernet.continue_offline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
