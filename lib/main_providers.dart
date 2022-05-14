
import 'package:flutter/cupertino.dart';

class FloatingButtonProvider extends ChangeNotifier{

  Widget Function(BuildContext context)? _floatingButtonBuilder;

  Widget Function(BuildContext context)? get floatingButtonBuilder => _floatingButtonBuilder;
  set floatingButtonBuilder(Widget Function(BuildContext context)? value){
    _floatingButtonBuilder = value;
    notifyListeners();
  }

  Widget build(BuildContext context){
    if(_floatingButtonBuilder == null) return Container();
    Widget floatingButton = _floatingButtonBuilder!(context);
    if(floatingButton == null) return Container();
    else return floatingButton;
  }

}

class AppBarProvider extends ChangeNotifier{

  Widget Function(BuildContext context)? _appBarBuilder;

  Widget Function(BuildContext context)? get appBarBuilder => _appBarBuilder;
  set appBarBuilder(Widget Function(BuildContext context)? value){
    _appBarBuilder = value;
    notifyListeners();
  }

  Widget build(BuildContext context){
    if(_appBarBuilder == null) return Container();
    Widget appBar = _appBarBuilder!(context);
    if(appBar == null) return Container();
    else return appBar;
  }

}