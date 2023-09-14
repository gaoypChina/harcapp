import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/trop.dart';
import 'model/trop_role.dart';
import 'model/trop_user.dart';

class TropUsersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onUsersLoaded;

  TropUsersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onUsersLoaded,
  });

}

class TropUsersLoader extends SingleComputer<String?, TropUsersLoaderListener>{

  @override
  String get computerName => 'TropUsersLoader';

  late Trop _trop;
  late int _pageSize;
  TropRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    Trop? trop,
    int pageSize = Trop.userPageSize,
    TropRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(trop != null);
    assert(trop!.key != null);
    _trop = trop!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (TropUsersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiTrop.getUsers(
        tropKey: _trop.key!,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<TropUser> usersPage){

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          TropUser me = _trop.getUser(AccountData.key!)!;
          TropUser? loadedMe = usersPage.where((user) => user.key == me.key).firstOrNull;
          if(loadedMe != null) {
            usersPage.removeWhere((user) => user.key == me.key);
            usersPage.insert(0, loadedMe);
          } else if(reloaded) {
            usersPage.removeWhere((user) => user.key == me.key);
            usersPage.insert(0, me);
          }

          if(reloaded)
            _trop.setAllLoadedUsers(usersPage);
          else
            _trop.addLoadedUsers(usersPage);

          _trop.saveShared();

          for(TropUsersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onUsersLoaded?.call(usersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(TropUsersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(TropUsersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

  }

}