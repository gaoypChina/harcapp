import 'package:flutter/material.dart';

class ComplTasksProvider extends ChangeNotifier{

  ComplTasksProvider();

  void notify(){
    notifyListeners();
  }

}