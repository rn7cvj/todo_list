import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';
import 'package:todo_list/controlles/settings.dart';
import 'package:restart_app/restart_app.dart';

import '../../i18n/strings.g.dart';

class SettingsPortrait extends StatelessWidget {
  SettingsPortrait({super.key});

  final Settings settings = GetIt.I<Settings>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(appPaddingMedium),
        child: Column(
          children: [
            // SwitchListTile(
            //   title: Text(t.settings.use_local_storage),
            //   subtitle: Text(t.settings.restart_required),
            //   value: settings.isUseLocalStorage(),
            //   onChanged: (newValue) {
            //     settings.setNewLocalStorageUse(newValue);
            //     Restart.restartApp();
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
