import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:logger/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/controlles/task_list.dart';

import 'package:todo_list/pages/add_task_page/add_task_page.dart';
import 'package:todo_list/pages/home_page/home_page.dart';

import 'navigator.dart';
import 'routes.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() {
  setUpSystemUIOverlay();

  GetIt.I.registerSingleton<TaskListContoller>(TaskListContoller());
  GetIt.I.registerSingleton<NavigationManager>(NavigationManager());

  runApp(const App());
}

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
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      navigatorKey: GetIt.I<NavigationManager>().key,
      initialRoute: RouteNames.initialRoute,
      routes: RoutesBuilder.routes,
    );
  }
}
