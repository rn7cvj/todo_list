import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';
import 'package:todo_list/data/storage/storage.dart';
import 'package:todo_list/routes.dart';

// import 'package:todo_list/controlles/task_list.dart';

import 'controlles/task_list.dart';
import 'i18n/strings.g.dart';
import 'navigator.dart';

void main() async {
  setUpSystemUIOverlay();

  await GetIt.I.registerSingleton<IBackendConnection>(BackendConnection()).init();
  await GetIt.I.registerSingleton<IStorage>(Storage()).init();

  await GetIt.I.registerSingleton<IApi>(Api()).init();

  await GetIt.I.registerSingleton<TaskListContoller>(TaskListContoller()).init();

  GetIt.I.registerSingleton<NavigationManager>(NavigationManager());

  LocaleSettings.useDeviceLocale(); //Угадайте, что делает эта строка

  runApp(TranslationProvider(child: const App()));
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
      navigatorKey: GetIt.I<NavigationManager>().key,
      initialRoute: RouteNames.initialRoute,
      routes: RoutesBuilder.routes,
    );
  }
}
