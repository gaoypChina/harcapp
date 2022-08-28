import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class FolderTabIndicator extends MaterialIndicator {

  FolderTabIndicator(BuildContext context) : super(
    height: 48.0,
    topRightRadius: AppCard.bigRadius,
    topLeftRadius: AppCard.bigRadius,
    color: backgroundIcon_(context)
  );

}