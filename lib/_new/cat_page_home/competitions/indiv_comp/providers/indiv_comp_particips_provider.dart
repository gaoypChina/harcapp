import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class IndivCompParticipsProvider extends ChangeNotifier{

  static IndivCompParticipsProvider of(BuildContext context) => Provider.of<IndivCompParticipsProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  IndivCompParticipsProvider();

  void notify() => notifyListeners();

}