import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account.dart';

class LoginProviderListener{

  final void Function(bool)? onLogin;
  final void Function()? onRegistered;
  final void Function(bool)? onEmailConfirmChanged;

  const LoginProviderListener({this.onLogin, this.onRegistered, this.onEmailConfirmChanged});

}

class LoginProvider extends ChangeNotifier{

  late List<LoginProviderListener?> _listeners;

  LoginProvider(){
    _listeners = [];
  }

  bool get loggedIn => AccountData.jwt!=null;

  void notify() => notifyListeners();

  void addLoginListener(LoginProviderListener? listener) => _listeners.add(listener);
  void removeLoginListener(LoginProviderListener? listener) => _listeners.remove(listener);

  void callOnLogin(bool emailConfirmed){
    for(LoginProviderListener? listener in _listeners)
      listener!.onLogin?.call(emailConfirmed);
  }

  void callOnRegister(){
    for(LoginProviderListener? listener in _listeners)
      listener!.onRegistered?.call();
  }

  void callOnEmailConfirmChanged(bool emailConfirmed){
    for(LoginProviderListener? listener in _listeners)
      listener!.onEmailConfirmChanged?.call(emailConfirmed);
  }

  static void addOnLoginListener(BuildContext context, LoginProviderListener listener) => Provider.of<LoginProvider>(context, listen: false).addLoginListener(listener);
  static void removeOnLoginListener(BuildContext context, LoginProviderListener listener) => Provider.of<LoginProvider>(context, listen: false).removeLoginListener(listener);

}