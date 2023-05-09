import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account.dart';

class LoginProvider extends ChangeNotifier{

  static LoginProvider of(BuildContext context) => Provider.of<LoginProvider>(context, listen: false);
  static notify_(BuildContext context) => of(context).notify();

  bool get loggedIn => AccountData.jwt!=null;

  void notify() => notifyListeners();

}