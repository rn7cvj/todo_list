import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/logger.dart';

String formatDateTime(BuildContext context, DateTime dateTime) {
  return DateFormat.yMMMEd(Localizations.localeOf(context).toString()).format(dateTime).toString();
}

void initCrashlytics() {
  FlutterError.onError = (erroDetails) {
    logger.d("Record flutter error");
    FirebaseCrashlytics.instance.recordFlutterError(erroDetails);
  };

  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    logger.d("Record platform error");
    FirebaseCrashlytics.instance.recordError(
      exception,
      stackTrace,
      fatal: true,
    );
    return true;
  };

  logger.i("Init crashlytics");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
