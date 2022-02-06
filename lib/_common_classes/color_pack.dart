import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';


abstract class DefColorPack extends ColorPack{

  static const Color ICON_DISABLED = AppColors.icon_disabled;
  static const Color ICON_ENABLED = AppColors.icon_enabled;

  @override
  String get name => 'DefColorPack';

  @override
  Color get appBar => Colors.white;

  @override
  Color get appBarTextEnab_ => Colors.black;

  @override
  Color get appBartextDisab_ => AppColors.text_def_disab;

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

  static const ACCENT_COLOR = Colors.white;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackSongBook extends DefColorPack{

  static final ACCENT_COLOR = Colors.grey;

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

class ColorPackOther extends DefColorPack{

  static const ACCENT_COLOR = Colors.grey;

  @override
  Color get accentColor => ACCENT_COLOR;

}

class ColorPackStartDefault extends ColorPack{

  const ColorPackStartDefault();

  @override
  String get name => 'ColorPackStartDefault';

  @override
  Color get appBarTextEnab_ => Colors.white;

  @override
  Color get accentColor => AppColors.app_orange_main;

  @override
  Color get darkColor => AppColors.start_background_default;

  //@override
  //Color get lightColor => AppColors.start_background_default;

  //@override
  //Color get mainColor => AppColors.start_background_default;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
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
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
}

class ColorPackStartChristmas extends ColorPack{

  const ColorPackStartChristmas();

  @override
  String get name => 'ColorPackStartChristmas';

  @override
  Color get appBarTextEnab_ => AppColors.icon_enabled;

  @override
  Color get appBartextDisab_ => AppColors.text_def_disab;

  @override
  Color get accentColor => Colors.white;

  @override
  Color get darkColor => mainColor;

  @override
  Color get lightColor => AppColors.start_background_christmas_light;

  @override
  Color get mainColor => AppColors.start_background_christmas;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
}

class ColorPackAccount extends ColorPack{

  const ColorPackAccount();

  @override
  String get name => 'ColorPackAccount';

  @override
  Color get appBarTextEnab_ => AppColors.icon_enabled;

  @override
  Color get appBartextDisab_ => AppColors.text_def_disab;

  @override
  Color get accentColor => AppColors.app_orange_accent;

  @override
  Color get darkColor => AppColors.app_orange_accent;

  @override
  Color get lightColor => AppColors.app_orange_accent;

  @override
  Color get mainColor => AppColors.app_orange_accent;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
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

class ColorPackGraphite extends ColorPack{

  const ColorPackGraphite();

  @override
  String get name => 'ColorPackGraphite';

  //@override
  //Color get appBarTextEnab_ => Colors.white;

  //@override
  //Color get appBartextDisab_ => Colors.white70;

  @override
  Color get textDrawer => Colors.white70;

  @override
  Color get hintDrawer => Colors.white30;

  @override
  Color get accentColor => Colors.indigo;

  //@override
  //Color get darkColor => Color.fromARGB(255, 55, 55, 65);

  //@override
  //Color get lightColor => Color.fromARGB(255, 95, 95, 105);

  //@override
  //Color get mainColor => Color.fromARGB(255, 75, 75, 85);

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;

  @override
  Color get drawerIconColor => Colors.white;

  @override
  Color get drawerIconDisabled => Colors.white54;
}

class ColorPackOrange extends ColorPack{

  const ColorPackOrange();

  @override
  String get name => 'ColorPackOrange';

  //@override
  //Color get appBarTextEnab_ => AppColors.icon_enabled;

  //@override
  //Color get appBartextDisab_ => AppColors.icon_disabled;

  @override
  Color get accentColor => AppColors.app_orange_accent;

  //@override
  //Color get darkColor => AppColors.app_orange_dark;

  //@override
  //Color get lightColor => AppColors.app_orange_light;

  //@override
  //Color get mainColor => AppColors.app_orange_main;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
}

class ColorPackYellow extends ColorPack{

  const ColorPackYellow();

  @override
  String get name => 'ColorPackYellow';

  //@override
  //Color get appBarTextEnab_ => AppColors.icon_enabled;

  //@override
  //Color get appBartextDisab_ => AppColors.icon_disabled;

  @override
  Color get accentColor => AppColors.app_yellow_accent;

  //@override
  //Color get darkColor => AppColors.app_yellow_dark;

  //@override
  //Color get lightColor => AppColors.app_yellow_light;

  //@override
  //Color get mainColor => AppColors.app_yellow_main;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
}

class ColorPackGreen extends ColorPack{

  const ColorPackGreen();

  @override
  String get name => 'ColorPackGreen';

  @override
  Color get appBarTextEnab_ => Colors.white;

  @override
  Color get appBartextDisab_ => Colors.white70;

  @override
  Color get accentColor => AppColors.app_green_accent;

  //@override
  //Color get darkColor => AppColors.app_green_dark;

  //@override
  //Color get lightColor => AppColors.app_green_light;

  //@override
  //Color get mainColor => AppColors.app_green_main;

  @override
  Color get accentIconColor => AppColors.icon_enabled;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;

  @override
  Color get drawerIconColor => Colors.white;

  @override
  Color get drawerIconDisabled => Colors.white54;
}

class ColorPackBlue extends ColorPack{

  const ColorPackBlue();

  @override
  String get name => 'ColorPackBlue';

  //@override
  //Color get appBarTextEnab_ => Colors.white;

  //@override
  //Color get appBartextDisab_ => Colors.white70;

  @override
  Color get accentColor => AppColors.app_blue_accent;

  //@override
  //Color get darkColor => AppColors.app_blue_dark;

  //@override
  //Color get lightColor => AppColors.app_blue_light;

  //@override
  //Color get mainColor => AppColors.app_blue_main;

  @override
  Color get accentIconColor => Colors.white;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;

  @override
  Color get drawerIconColor => Colors.white;

  @override
  Color get drawerIconDisabled => Colors.white54;
}

class ColorPackWhite extends ColorPack{

  const ColorPackWhite();

  @override
  String get name => 'ColorPackWhite';

  //@override
  //Color get appBarTextEnab_ => AppColors.icon_enabled;

  //@override
  //Color get appBartextDisab_ => AppColors.text_def_disab;

  @override
  Color get accentColor => AppColors.app_white_accent;

  //@override
  //Color get darkColor => AppColors.app_white_dark;

  //@override
  //Color get lightColor => AppColors.app_white_light;

  //@override
  //Color get mainColor => AppColors.app_white_main;

  @override
  Color get accentIconColor => Colors.black;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  @override
  Color get iconDisabled => AppColors.icon_disabled;
}

class ColorPackGamePytaki extends ColorPack{
  @override
  Color get accentColor => Colors.red;

  @override
  Color get accentIconColor => AppColors.text_def_enab;

  //@override
  //Color get darkColor => Colors.orange;

  @override
  Color get iconDisabled => AppColors.icon_disabled;

  @override
  Color get iconEnabled => AppColors.icon_enabled;

  //@override
  //Color get lightColor => Colors.yellow;

  //@override
  //Color get mainColor => Colors.orangeAccent;

  @override
  String get name => 'ColorPackGamePytaki';

}