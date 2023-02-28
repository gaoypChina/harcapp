import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApelEwanFolderProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class ApelEwanAllFoldersProvider extends ChangeNotifier{

  static ApelEwanAllFoldersProvider of(BuildContext context) => Provider.of<ApelEwanAllFoldersProvider>(context, listen: false);

  static final List<void Function()> _listeners = [];

  static void addChangeListener(void Function() listener) => _listeners.add(listener);
  static void removeChangeListener(void Function() listener) => _listeners.remove(listener);

  void notify(){
    for(void Function() listener in _listeners)
      listener.call();
    notifyListeners();
  }

}

class BindedIndivCompsProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}