import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';

class AccentColorProvider extends ChangeNotifier{

  String? _colorsKey;

  AccentColorProvider(String colorKey){
    _colorsKey = colorKey??CommonColorData.DEF_COLORS_KEY;
  }

  String? get colorsKey => _colorsKey;
  set colorsKey(String? value){
    _colorsKey = value;
    notifyListeners();
  }

  Color get avgColor => CommonColorData.ALL[_colorsKey!]!.avgColor;

  Color? get color1 => CommonColorData.ALL[_colorsKey!]!.colorStart;
  Color? get color2 => CommonColorData.ALL[_colorsKey!]!.colorEnd;
  Color get accIconColor => Colors.white;

}

class IconProvider extends ChangeNotifier{

  String? _iconKey;

  IconProvider(String iconKey){
    _iconKey = iconKey??CommonIconData.DEF_ICON_KEY;
  }

  String? get iconKey => _iconKey;
  set iconKey(String? value){
    _iconKey = value;
    notifyListeners();
  }

  IconData? get icon => CommonIconData.ALL[_iconKey!];

}