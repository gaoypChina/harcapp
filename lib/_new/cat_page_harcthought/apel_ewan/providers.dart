import 'package:flutter/material.dart';

class ApelEwanFolderProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class ApelEwanAllFoldersProvider extends ChangeNotifier{

  static final List<void Function()> _listeners = [];

  static void addChangeListener(void Function() listener) => _listeners.add(listener);
  static void removeChangeListener(void Function() listener) => _listeners.remove(listener);

  void notify(){
    for(void Function() listener in _listeners)
      listener.call();
    notifyListeners();
  }

}