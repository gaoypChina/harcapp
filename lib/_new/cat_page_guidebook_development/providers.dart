import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SprawProvider extends ChangeNotifier{

  static SprawProvider of(BuildContext context) => Provider.of<SprawProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SprawSavedListProvider extends ChangeNotifier{

  static SprawSavedListProvider of(BuildContext context) => Provider.of<SprawSavedListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SprawInProgressListProvider extends ChangeNotifier{

  static SprawInProgressListProvider of(BuildContext context) => Provider.of<SprawInProgressListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SprawCompletedListProvider extends ChangeNotifier{

  static SprawCompletedListProvider of(BuildContext context) => Provider.of<SprawCompletedListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class RankProv extends ChangeNotifier{

  static RankProv of(BuildContext context) => Provider.of<RankProv>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}
