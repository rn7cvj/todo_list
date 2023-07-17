import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get_it/get_it.dart';
import 'package:todo_list/api/api.dart';
import 'package:todo_list/controlles/settings.dart';
import 'package:todo_list/data/backend_connection/backend_connection.dart';
import 'package:todo_list/data/storage/storage.dart';
import 'package:todo_list/logger.dart';

// import 'package:todo_list/controlles/task_list.dart';

import 'controlles/task_list.dart';
import 'i18n/strings.g.dart';
import 'navigation/navigation_state.dart';
import 'navigation/route_information_parser.dart';
import 'navigation/router_delegate.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  setUpSystemUIOverlay();

  await GetIt.I.registerSingleton<Settings>(Settings()).init();

  await GetIt.I.registerSingleton<IBackendConnection>(BackendConnection()).init();
  await GetIt.I.registerSingleton<IStorage>(Storage()).init();

  await GetIt.I.registerSingleton<IApi>(Api()).init();

  await GetIt.I.registerSingleton<TaskListContoller>(TaskListContoller()).init();

  final routerDelegate = MyRouterDelegate();
  routerDelegate.state = NavigationState.internetCheck();

  GetIt.I.registerSingleton<IRouter>(routerDelegate);
  GetIt.I.registerSingleton<RouterDelegate<NavigationState>>(routerDelegate);

  LocaleSettings.useDeviceLocale(); //Угадайте, что делает эта строка

  logger.i(await GetIt.I<IApi>().updateApiStatus());

  GetIt.I<RouterDelegate<NavigationState>>();

  runApp(TranslationProvider(child: App()));
}

//Перевод приложения в полноэкранный режим
void setUpSystemUIOverlay() {
  // Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
  // Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class App extends StatelessWidget {
  App({super.key});

  final _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routerDelegate: GetIt.I<RouterDelegate<NavigationState>>(),
      routeInformationParser: _routeInformationParser,
    );
  }
}
