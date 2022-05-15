import 'dart:ui';

Color? hexToColor(String? code) => code==null?null:Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

String? colorToHex(Color? color) => color==null?null:'#${color.value.toRadixString(16)}';