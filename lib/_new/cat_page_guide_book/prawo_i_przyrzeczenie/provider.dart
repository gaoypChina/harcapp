import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier{

  Widget Function(BuildContext context) _tabBarBuilder;

  Widget Function(BuildContext context) get tabBarBuilder => _tabBarBuilder;

  set tabBarBuilder(Widget Function(BuildContext context) value){
    _tabBarBuilder = value;
    notifyListeners();
  }

}