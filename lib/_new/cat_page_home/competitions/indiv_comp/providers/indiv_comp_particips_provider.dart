import 'package:flutter/foundation.dart';

class IndivCompParticipsProvider extends ChangeNotifier{

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