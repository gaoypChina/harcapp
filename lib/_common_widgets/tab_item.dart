import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

import '../_common_classes/color_pack.dart';

class TabItem {
  final String? text;
  final Icon? icon;
  final Widget? child;

  const TabItem({this.text, this.icon, this.child});
}
