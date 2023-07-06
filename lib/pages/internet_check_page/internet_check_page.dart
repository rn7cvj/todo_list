import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/constants.dart';

import '../../api/api.dart';
import 'internet_check_portrait.dart';

class InternetCheckPage extends StatelessWidget {
  InternetCheckPage({super.key, required this.onInternetAvalible, required this.onInternetUnavalible}) {
    Timer(animationDurationVerySlow, () async {
      ApiStatus apiStatus = await api.updateApiStatus();

      await api.tryToSync();

      if (apiStatus == ApiStatus.localStorageOnly) {
        onInternetUnavalible();
      }

      if (apiStatus == ApiStatus.localAndRemoteStorage) {
        onInternetAvalible();
      }
    });
  }

  IApi api = GetIt.I<IApi>();

  final void Function() onInternetAvalible;
  final void Function() onInternetUnavalible;

  @override
  Widget build(BuildContext context) {
    return InternetCheckPortait();
  }
}
