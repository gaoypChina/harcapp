import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';


abstract class DefColorPack extends ColorPack{

  static const Color ICON_DISABLED = AppColors.iconDisabled;
  static const Color ICON_ENABLED = AppColors.iconEnabled;

  @override
  String get name => 'DefColorPack';

  @override
  Color get appBar => Colors.white;

  @override
  Color get appBarTextEnab_ => Colors.black;

  @override
  Color get appBartextDisab_ => AppColors.textDefDisab;

  @override
  Color get accentIconColor => Colors.black;

  //@override
  //Color get darkColor => Color.fromARGB(255, 240, 240, 240);

  @override
  Color get iconDisabled => ICON_DISABLED;

  @override
  Color get iconEnabled => ICON_ENABLED;

  //@override
  //Color get lightColor => Colors.white;

  @override
  Color get mainColor => Colors.white;

}

class ColorPackHome extends DefColorPack{

  static const ACCENT_COLOR = Colors.blue;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackHarcMap extends DefColorPack{

  static const ACCENT_COLOR = Colors.blue;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackSongBook extends DefColorPack{

  static const ACCENT_COLOR = Colors.grey;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackHarcthought extends DefColorPack{

  static const ACCENT_COLOR = Colors.blueGrey;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackGuideBook extends DefColorPack{

  static const ACCENT_COLOR = Colors.blueGrey;

  @override
  Color get accentColor => ACCENT_COLOR;

  @override
  Color get accentIconColor => Colors.white;

}

class ColorPackStrefaDucha extends DefColorPack{

  static const ACCENT_COLOR = Colors.grey;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackStartDefault extends ColorPack{

  static const ACCENT_COLOR = Colors.blueGrey;

  const ColorPackStartDefault();

  @override
  String get name => 'ColorPackStartDefault';

  @override
  Color get appBarTextEnab_ => Colors.white;

  @override
  Color get accentColor => ACCENT_COLOR;

  @override
  Color get darkColor => AppColors.startBackgroundDefault;

  //@override
  //Color get lightColor => AppColors.start_background_default;

  //@override
  //Color get mainColor => AppColors.start_background_default;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.iconEnabled;

  @override
  Color get iconDisabled => AppColors.iconDisabled;
}

class ColorPackStartAdwent extends ColorPack{

  const ColorPackStartAdwent();

  @override
  String get name => 'ColorPackStartAdwent';

  //@override
  //Color get appBarTextEnab_ => AppColors.icon_enabled;

  //@override
  //Color get appBartextDisab_ => AppColors.text_def_disab;

  @override
  Color get accentColor => Colors.white;

  //@override
  //Color get darkColor => mainColor;

  //@override
  //Color get lightColor => Colors.deepPurple;

  //@override
  //Color get mainColor => Colors.deepPurple;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.iconEnabled;

  @override
  Color get iconDisabled => AppColors.iconDisabled;
}

class ColorPackStartChristmas extends ColorPack{

  const ColorPackStartChristmas();

  @override
  String get name => 'ColorPackStartChristmas';

  @override
  Color get appBarTextEnab_ => AppColors.iconEnabled;

  @override
  Color get appBartextDisab_ => AppColors.textDefDisab;

  @override
  Color get accentColor => Colors.white;

  @override
  Color get darkColor => mainColor;

  @override
  Color get lightColor => AppColors.startBackgroundChristmasLight;

  @override
  Color get mainColor => AppColors.startBackgroundChristmas;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.iconEnabled;

  @override
  Color get iconDisabled => AppColors.iconDisabled;
}

class ColorPackAccount extends ColorPack{

  static const ACCENT_COLOR = Colors.blueGrey;

  const ColorPackAccount();

  @override
  String get name => 'ColorPackAccount';

  @override
  Color get accentColor => ACCENT_COLOR;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.iconEnabled;

  @override
  Color get iconDisabled => AppColors.iconDisabled;
}

class ColorPackBlack extends ColorPack{

  static const Color APP_BAR_TEXT_ENABLED = Colors.white;
  static const Color APP_BAR_TEXT_DISABLED = Colors.white70;
  static const Color TEXT_ENABLED = Colors.white;
  static const Color TEXT_DISABLED = Colors.white54;

  static const Color ICON_ENABLED = Colors.white;
  static const Color ICON_DISABLED = Colors.white54;

  static const Color CARD_ENAB = Color.fromARGB(255, 30, 30, 30);

  const ColorPackBlack();

  @override
  String get name => 'ColorPackBlack';

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get appBarTextEnabled => APP_BAR_TEXT_ENABLED;

  //@override
  //Color get appBarTextDisabled => APP_BAR_TEXT_DISABLED;

  @override
  Color get textEnabled => TEXT_ENABLED;

  @override
  Color get textDisabled => TEXT_DISABLED;


  @override
  Color get textDrawer => Colors.white70;

  @override
  Color get hintDrawer => Colors.white54;


  @override
  Color get hintEnabled => Colors.white54;


  @override
  Color get defCardEnabled => CARD_ENAB;

  @override
  Color get defCardDisabled => Color.fromARGB(255, 60, 60, 60);

  @override
  Color get defCardElevation => Color.fromARGB(120, 255, 255, 255);


  @override
  Color get background => AppColors.main_background_dark;

  @override
  Color get backgroundIcon => Colors.white24;

  @override
  Color get accentColor => AppColors.app_black_accent;

  //@override
  //Color get darkColor => AppColors.app_black_dark;

  //@override
  //Color get lightColor => AppColors.app_black_light;

  //@override
  //Color get mainColor => AppColors.app_black_main;

  @override
  Color get accentIconColor => Colors.black;

  @override
  Color get iconEnabled => Colors.white;

  @override
  Color get iconDisabled => Colors.white54;

}

class ColorPackGamePytaki extends ColorPack{
  @override
  Color get accentColor => Colors.red;

  @override
  Color get accentIconColor => AppColors.textDefEnab;

  //@override
  //Color get darkColor => Colors.orange;

  @override
  Color get iconDisabled => AppColors.iconDisabled;

  @override
  Color get iconEnabled => AppColors.iconEnabled;

  //@override
  //Color get lightColor => Colors.yellow;

  //@override
  //Color get mainColor => Colors.orangeAccent;

  @override
  String get name => 'ColorPackGamePytaki';

}