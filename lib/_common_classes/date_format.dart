// import 'package:intl/intl.dart';
// String formatDate(DateTime date) => DateFormat('yyyy-MM-dd', 'pl').format(date);

String formatDate(DateTime date) => ""
    "${"${date.year}".padLeft(4, '0')}-"
    "${"${date.month}".padLeft(2, '0')}-"
    "${"${date.day}".padLeft(2, '0')}";
