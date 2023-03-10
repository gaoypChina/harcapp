import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:provider/provider.dart';

class AccentColorProvider extends ChangeNotifier{

  static AccentColorProvider of(BuildContext context) => Provider.of<AccentColorProvider>(context, listen: false);

  late String _colorsKey;

  AccentColorProvider(String colorKey){
    _colorsKey = colorKey;
  }

  String get colorsKey => _colorsKey;
  set colorsKey(String value){
    _colorsKey = value;
    notifyListeners();
  }

  Color get avgColor => CommonColorData.get(_colorsKey).avgColor;

  Color? get color1 => CommonColorData.get(_colorsKey).colorStart;
  Color? get color2 => CommonColorData.get(_colorsKey).colorEnd;
  Color get accIconColor => Colors.white;

}

class IconProvider extends ChangeNotifier{

  static IconProvider of(BuildContext context) => Provider.of<IconProvider>(context, listen: false);

  String _iconKey;

  IconProvider(String iconKey): _iconKey = iconKey;

  String get iconKey => _iconKey;
  set iconKey(String value){
    _iconKey = value;
    notifyListeners();
  }

  IconData get icon => CommonIconData.get(_iconKey);

}