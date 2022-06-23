import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePartProvider extends ChangeNotifier{

  static const drawerPageOverview = 'overview';
  static const drawerPageCompetitions = 'competitions';
  static const drawerPageCircles = 'circles';

  late String _selectedDrawerPage;
  String get selectedDrawerPage => _selectedDrawerPage;
  set selectedDrawerPage(String value){
    _selectedDrawerPage = value;
    notifyListeners();
  }

  static HomePartProvider of(BuildContext context) => Provider.of<HomePartProvider>(context, listen: false);

  HomePartProvider(){
    _selectedDrawerPage = drawerPageOverview;
  }

  void notify() => notifyListeners();

}