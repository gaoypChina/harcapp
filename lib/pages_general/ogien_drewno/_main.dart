import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp/values/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'child_bezpieczenstwo.dart';
import 'child_ogniska.dart';

class OgienDrewnoFragment extends StatelessWidget {

  static const List<TabItem> _tabs = [

    const TabItem(
        icon: const Icon(MdiIcons.fire),
        child: const ChildOgniska()
    ),
  ];

  @override
  Widget build(BuildContext context) =>
      ColoredTabController(
        tabs: _tabs,
      );

  @override
  String get title => Strings.nav_ogien_drewno_title;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(
            MdiIcons.shieldCheckOutline,
            color: appBarTextEnab_(context),
          ),
          onPressed: () {

            GlobalKey globalKey = GlobalKey();
            showScrollBottomSheet(
                context: context,
                builder: (context) => BottomSheetDef(
                  title: 'Bezpieczeństwo',
                  builder: (context) => ChildBezpieczenstwo()
                ),
            );
          },
        )
      ],
    );
  }

}