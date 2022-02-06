import 'package:logger/logger.dart';

Logger logger = Logger(
  filter: null,
  printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: false,
  ),
);