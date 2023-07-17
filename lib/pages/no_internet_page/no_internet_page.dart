import 'package:flutter/material.dart';
import 'package:todo_list/pages/no_internet_page/no_internet_landscape.dart';
import 'package:todo_list/pages/orintaion_page.dart';

import 'no_internet_portrait.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationPage(landscapePage: const NoInternetLandscape(), portraitPage: NoInternetPortrait());
  }
}
