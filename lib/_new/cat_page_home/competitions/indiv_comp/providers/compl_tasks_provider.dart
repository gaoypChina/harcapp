import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplTasksProvider extends ChangeNotifier{

  static ComplTasksProvider of(BuildContext context) => Provider.of<ComplTasksProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  ComplTasksProvider();

  void notify(){
    notifyListeners();
  }

}