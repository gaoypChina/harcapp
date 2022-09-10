import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class IndivCompParticipsProvider extends ChangeNotifier{

  static IndivCompParticipsProvider of(BuildContext context) => Provider.of<IndivCompParticipsProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  static List<void Function()> _listeners = [];

  IndivCompParticipsProvider();

  static void addOnNotifyListener(void Function() listener){
    _listeners.add(listener);
  }

  static void removeOnNotifyListener(void Function() listener){
    _listeners.remove(listener);
  }

  void notify(){
    for(void Function() listener in _listeners)
      listener.call();
    notifyListeners();
  }

}