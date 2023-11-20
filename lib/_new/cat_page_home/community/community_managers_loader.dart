import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/community.dart';
import 'model/community_manager.dart';
import 'model/community_role.dart';

class CommunityManagersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onManagersLoaded;

  CommunityManagersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onManagersLoaded,
  });

}

class CommunityManagersLoader extends SingleComputer<String?, CommunityManagersLoaderListener>{

  @override
  String get computerName => 'CommunityManagersLoader';

  late Community _community;
  late int _pageSize;
  CommunityRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    Community? community,
    int pageSize = Community.managersPageSize,
    CommunityRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(community != null);
    _community = community!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (CommunityManagersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiCommunity.getManagers(
        communityKey: _community.key,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<CommunityManager> managersPage){

          bool reloaded = _lastUserName == null && _lastUserKey == null;

          CommunityManager me = _community.getManager(AccountData.key!)!;
          CommunityManager? loadedMe = managersPage.where((manager) => manager.key == me.key).firstOrNull;
          if(loadedMe != null) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, loadedMe);
          } else if(reloaded) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, me);
          }

          if(reloaded)
            _community.setAllLoadedManagers(managersPage);
          else
            _community.addLoadedManagers(managersPage);

          for(CommunityManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onManagersLoaded?.call(managersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(CommunityManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(CommunityManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}