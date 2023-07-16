import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTime(BuildContext context, DateTime dateTime) {
  return DateFormat.yMMMEd(Localizations.localeOf(context).toString())
      .format(dateTime)
      .toString();
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
