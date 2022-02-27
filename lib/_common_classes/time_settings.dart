import 'package:flutter/services.dart';
import 'package:system_time_check/system_time_check.dart';

class TimeSettings{

  static Future<bool> get isTimeAutomatic async {
    bool isTimeAutomatic;
    try {isTimeAutomatic = await SystemTimeCheck.isSystemTimeAutomatic ?? false;}
    on PlatformException {isTimeAutomatic = false;}

    return isTimeAutomatic;
  }

}