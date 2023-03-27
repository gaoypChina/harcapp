import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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

  static FloatingButtonProvider of(BuildContext context) => Provider.of<FloatingButtonProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  Widget Function()? _builder;

  Widget Function()? get builder => _builder;

  set builder(Widget Function()? value){
    _builder = value;
    notifyListeners();
  }

  late bool Function() _show;
  bool get show => _show();

  void set(bool Function() show, Widget Function() builder){
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