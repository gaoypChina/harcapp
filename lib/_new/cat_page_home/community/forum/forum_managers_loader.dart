import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'forum_role.dart';
import 'model/forum.dart';
import 'model/forum_manager.dart';

class ForumManagersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<ForumManager>, bool)? onManagersLoaded;

  ForumManagersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onManagersLoaded,
  });

}

class ForumManagersLoader extends SingleComputer<String?, ForumManagersLoaderListener>{

  @override
  String get computerName => 'ForumManagersLoader';

  late Forum _forum;
  late int _pageSize;
  ForumRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    Forum? forum,
    int pageSize = Forum.managerPageSize,
    ForumRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(forum != null);
    _forum = forum!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (ForumManagersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiForum.getManagers(
        forumKey: _forum.key,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<ForumManager> managersPage){

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          ForumManager me = _forum.getManager(AccountData.key!)!;
          ForumManager? loadedMe = managersPage.where((manager) => manager.key == me.key).firstOrNull;
          if(loadedMe != null) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, loadedMe);
          } else if(reloaded) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, me);
          }

          if(reloaded)
            _forum.setAllLoadedManagers(managersPage);
          else
            _forum.addLoadedManagers(managersPage);

          for(ForumManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onManagersLoaded?.call(managersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(ForumManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(ForumManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

  }

}