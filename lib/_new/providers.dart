import 'package:flutter/cupertino.dart';

class DrawerProvider extends ChangeNotifier{

  Widget Function(/*BuildContext*/)? _builder;

  Widget Function(/*BuildContext*/)? get builder => _builder;

  set builder(Widget Function(/*BuildContext*/)? value){
    _builder = value;
    notifyListeners();
  }

  late bool Function() _show;
  bool get show => _show();

  void set(bool Function() show, Widget Function(/*BuildContext*/) builder){
    _show = show;
    _builder = builder;
    notifyListeners();
  }

  DrawerProvider(){
    _show = () => false;
    builder = (/*context*/) => Container();
  }

  void notify() => notifyListeners();

}

class FloatingButtonProvider extends ChangeNotifier{

  Widget Function(/*BuildContext*/)? _builder;

  Widget Function(/*BuildContext*/)? get builder => _builder;

  set builder(Widget Function(/*BuildContext*/)? value){
    _builder = value;
    notifyListeners();
  }

  late bool Function() _show;
  bool get show => _show();

  void set(bool Function() show, Widget Function(/*BuildContext*/) builder){
    _show = show;
    _builder = builder;
    notifyListeners();
  }

  FloatingButtonProvider(){
    _show = () => false;
    builder = (/*context*/) => Container();
  }

  void notify() => notifyListeners();

}