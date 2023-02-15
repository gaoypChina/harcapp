import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SprawSavedListProv extends ChangeNotifier{

  static SprawSavedListProv of(BuildContext context) => Provider.of<SprawSavedListProv>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SprawInProgressListProv extends ChangeNotifier{

  static SprawInProgressListProv of(BuildContext context) => Provider.of<SprawInProgressListProv>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SprawCompletedListProv extends ChangeNotifier{

  static SprawCompletedListProv of(BuildContext context) => Provider.of<SprawCompletedListProv>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class RankProv extends ChangeNotifier{

  static RankProv of(BuildContext context) => Provider.of<RankProv>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}
