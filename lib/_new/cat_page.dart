import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import '../main_providers.dart' as app_provs;


abstract class CatPageState<T extends StatefulWidget> extends State<T> with AfterLayoutMixin<T>{

  @override
  void afterFirstLayout(BuildContext context) {
    //buildPart(context);
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = colorPack);
  }

  ColorPack get colorPack;

  //updateFloatingButton(BuildContext context) => Provider.of<FloatingButtonProvider>(context, listen: false).set(showFloatingButton, buildFloatingButton);
  //updateDrawer(BuildContext context) => Provider.of<DrawerProvider>(context, listen: false).set(showDrawer, drawerBuilder);

}