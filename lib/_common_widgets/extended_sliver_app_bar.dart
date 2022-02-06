import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

class ExtendedSliverAppBar extends StatefulWidget{

  final int initIndex;
  final TextTheme textTheme;

  final Color backgroundColor;
  final bool pinned;

  final Color titleColor;
  final List<String> titles;

  final TabController tabController;
  final List<Tab> tabs;

  final void Function(int index, double offset) onChanged;

  final List<Widget> actions;

  const ExtendedSliverAppBar({
    this.initIndex=0,
    this.textTheme,

    this.backgroundColor,
    this.pinned,

    @required this.titleColor,
    @required this.titles,

    this.tabController,
    this.tabs,

    this.onChanged,

    this.actions,
  });

  @override
  State<StatefulWidget> createState() => ExtendedSliverAppBarState();

}

class ExtendedSliverAppBarState extends State<ExtendedSliverAppBar> with TickerProviderStateMixin{

  static double _appBarHeight = AppBar().preferredSize.height;
  static double _tabBarHeight = TabBar(tabs: []).preferredSize.height;

  TextTheme get textTheme => widget.textTheme;

  Color get backgroundColor => widget.backgroundColor;
  bool get pinned => widget.pinned;

  Color get titleColor => widget.titleColor;
  List<String> get titles => widget.titles;

  List<Tab> get tabs => widget.tabs;

  void Function(int index, double offset) get onChanged => widget.onChanged;

  TabController _tabController;
  TabController get tabController => widget.tabController??_tabController;
  PageController pageControllerTitle;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    pageControllerTitle = PageController(initialPage: widget.initIndex);

    if(onChanged != null)
      tabController.animation.addListener(() => onChanged(tabController.index, tabController.offset));
    //tabController.animation.addListener(() => pageController.jumpTo(MediaQuery.of(context).size.width * (tabController.index + tabController.offset)));
    tabController.animation.addListener(() => pageControllerTitle.jumpTo(_appBarHeight * (tabController.index + tabController.offset)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => _StretchProvider(_appBarHeight + _tabBarHeight),
      child: SliverAppBar(
        textTheme: textTheme,
        //backgroundColor: backgroundColor,
        floating: true,
        pinned: pinned,

        title: Consumer<_StretchProvider>(
          builder: (context, prov, child) => SizedBox(
            height: _appBarHeight,
            width: double.infinity,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageControllerTitle,
              scrollDirection: Axis.vertical,
              pageSnapping: false,
              children: titles.map((title) => _TitleText(
                  title: title,
                  titleColor: iconEnab_(context),
                  animation: tabController.animation,
                  index: titles.indexOf(title))).toList(),
            ),
          )
        ),

        actions: widget.actions,

        bottom: TabBar(
          controller: tabController,
          physics: BouncingScrollPhysics(),
          tabs: tabs,
          labelColor: backgroundColor,
          unselectedLabelColor: iconDisab_(context),
          indicator: AppTabBarIncdicator(color: backgroundColor)
        ),
      )
    );

  }

}

class _TitleText extends StatelessWidget{

  final String title;
  final Color titleColor;
  final Animation<double> animation;
  final int index;
  
  const _TitleText({this.title, this.titleColor, this.animation, this.index});
  
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: animation,
      child: Center(
        child: Text(title, style: AppTextStyle(color: titleColor), textAlign: TextAlign.center),
      ),
      builder: (context, child){

        double dist = (animation.value - index).abs()*2;
        return Opacity(
            opacity: 1-cos(pi/2 * (1 - min(1, dist))),
            child: child
        );
      }
    );
  }
  
}

class _StretchProvider extends ChangeNotifier{

  double _minSize;
  bool _isMinSize;

  _StretchProvider(this._minSize){
    _isMinSize = false;
  }

  get isMinSize => _isMinSize;
  set size(double value){
    if(value == _minSize && !isMinSize) {
      _isMinSize = true;
      post(() => notifyListeners());
    }else if(value != _minSize && isMinSize){
      _isMinSize = false;
      post(() => notifyListeners());
    }
  }


  void notify() => notifyListeners();

}