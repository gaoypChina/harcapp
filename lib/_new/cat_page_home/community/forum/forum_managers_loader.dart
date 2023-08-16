import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'forum_role.dart';
import 'model/forum.dart';
import 'model/forum_manager.dart';

class ForumManagersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<ForumManager>, bool)? onManagersLoaded;

  const ForumManagersLoaderListener({
    super.onStart,
    super.onError,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onManagersLoaded,
  });

}

class ForumManagersLoader extends SingleComputer<String?, ForumManagersLoaderListener>{

  @override
  String get computerName => 'IndivCompParticipantsLoader';

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
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiForum.getManagers(
        forumKey: _forum.key,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<ForumManager> managersPage){

          ForumManager me = _forum.getManager(AccountData.key!)!;
          participsPage.removeWhere((member) => member.key == me.key);
          participsPage.insert(0, me);

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          if(reloaded)
            _comp.setAllLoadedParticips(participsPage);
          else
            _comp.addLoadedParticips(participsPage);

          for(IndivCompParticipantsLoaderListener? listener in listeners)
            listener!.onIndivCompParticipantsLoaded?.call(participsPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(IndivCompParticipantsLoaderListener? listener in listeners)
            listener!.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(IndivCompParticipantsLoaderListener? listener in listeners)
            listener!.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

    return true;
  }

}