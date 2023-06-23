import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/backend_connection/backend_connection.dart';
import 'package:todo_list/logger.dart';
import 'package:todo_list/modals/task.dart';
import 'package:todo_list/storage/storage.dart';

// import 'package:todo_list/controlles/task_list.dart';

import 'i18n/strings.g.dart';
// import 'navigator.dart';
// import 'routes.dart';

void main() async {
  // setUpSystemUIOverlay();

  GetIt.I.registerSingleton<IBackendConnection>(BackendConnection());
  GetIt.I.registerSingleton<IStorage>(Storage());

  GetIt.I.registerSingleton<IApi>(Api());

  // LocaleSettings.useDeviceLocale(); //Угадайте, что делает эта строка

  // runApp(TranslationProvider(child: const App()));
}

//Перевод приложения в полноэкранный режим
void setUpSystemUIOverlay() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  // Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      // navigatorKey: GetIt.I<NavigationManager>().key,
      // initialRoute: RouteNames.initialRoute,
      // routes: RoutesBuilder.routes,
    );
  }
}
