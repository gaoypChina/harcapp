import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

import '../_common_classes/color_pack.dart';

class TabItem {
  final String text;
  final Icon icon;
  final Widget child;

  const TabItem({this.text, this.icon, this.child});
}

class ColoredTabBar extends StatelessWidget implements PreferredSizeWidget {

  final Color color;
  final TabBar tabBar;
  final bool elevated;
  final Color background;

  const ColoredTabBar(this.color, this.tabBar, {this.elevated = true, this.background = Colors.transparent});

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) => Material(
    elevation: elevated?3:0,
    color: color,
    child: Container(
      color: background,
      child: tabBar,
    ),
  );
}

class ColoredTabController extends StatelessWidget{

  final List<TabItem> tabs;
  final Color background;
  final Color bodyBackground;
  final Color iconColorEnabled;
  final Color iconColorDisabled;
  final bool isScrollable;
  final TabController controller;
  final bool tabsOnBottom;
  final bool showTabs;
  final bool elevated;

  const ColoredTabController({
    @required this.tabs,
    this.background,
    this.bodyBackground,
    this.iconColorEnabled,
    this.iconColorDisabled,
    this.isScrollable:false,
    this.controller,
    this.tabsOnBottom: false,
    this.showTabs: true,
    this.elevated: true,
  });

  @override
  Widget build(BuildContext context) {

    Widget tabLayout = ColoredTabBar(
      background??cardEnab_(context),
      TabBar(
        controller: controller,
        labelStyle: AppTextStyle(),
        isScrollable: isScrollable,
        labelColor: iconColorEnabled??appBarTextEnab_(context),
        unselectedLabelColor: iconColorDisabled??cardEnab_(context),
        indicatorColor: accent_(context),
        tabs: tabs.map((tab) =>
            Tab(
                text: tab.text==null?null:tab.text.toUpperCase(),
                icon: tab.icon)).toList(),
      ),
      elevated: elevated,
    );

    return DefaultTabController(
        length: tabs.length,
        child: AppScaffold(
          backgroundColor: bodyBackground,
          appBar: (!tabsOnBottom && showTabs)?tabLayout:null,
          body: TabBarView(
              physics: BouncingScrollPhysics(),
              controller: controller,
              children: tabs.map((tab) => tab.child).toList()
          ),
          bottomNavigationBar:
          (tabsOnBottom && showTabs)?
          tabLayout:null,
        )
    );
  }
}