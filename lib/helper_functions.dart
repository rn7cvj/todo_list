import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTime(BuildContext context, DateTime dateTime) {
  return DateFormat.yMMMEd(Localizations.localeOf(context).toString()).format(dateTime).toString();
}
