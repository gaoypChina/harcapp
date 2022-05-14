import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class AppTabBarIncdicator extends MaterialIndicator{

  AppTabBarIncdicator({BuildContext? context, Color? color}):super(
      horizontalPadding: 12.0,
      height: 3,
      color: color??accent_(context!)
  ){assert(context != null || color != null);}

}