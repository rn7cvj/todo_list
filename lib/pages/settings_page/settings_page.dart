import 'package:flutter/material.dart';
import 'package:todo_list/pages/orintaion_page.dart';
import 'package:todo_list/pages/settings_page/settings_landscape.dart';
import 'package:todo_list/pages/settings_page/settings_portrait.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationPage(landscapePage: SettingsLandscape(), portraitPage: SettingsPortrait());
  }
}
