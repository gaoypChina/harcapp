import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class HeaderTextStyle extends CustTextStyle{

  const HeaderTextStyle({Color color: AppColors.text_def_enab, weight fontWeight:weight.normal, fontSize, bool? shadow, FontStyle? fontStyle, double height: 1.0}):super(
      'Gentium',
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      shadow: shadow
  );
}

class Parag1TextStyle extends CustTextStyle{

  static const String FAMILY = 'Lato';

  const Parag1TextStyle({Color color: AppColors.text_def_enab, weight fontWeight:weight.normal, fontSize, bool? shadow, FontStyle? fontStyle, double height: 1.0}):super(
      FAMILY,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      shadow: shadow
  );
}

class Parag2TextStyle extends CustTextStyle{

  static const String FAMILY = 'PlayfairDisplay';

  const Parag2TextStyle({Color color: AppColors.text_def_enab, weight fontWeight:weight.normal, fontSize, bool? shadow, FontStyle? fontStyle, double height: 1.0}):super(
      FAMILY,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      shadow: shadow
  );
}

class Parag3TextStyle extends CustTextStyle{

  static const String FAMILY = 'Merriweather';

  const Parag3TextStyle({Color color: AppColors.text_def_enab, weight fontWeight:weight.normal, fontSize, bool? shadow, FontStyle? fontStyle, double height: 1.0}):super(
      FAMILY,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      fontSize: fontSize,
      height: height,
      shadow: shadow
  );
}