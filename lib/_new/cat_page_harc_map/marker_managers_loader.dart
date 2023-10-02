import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import '../api/harc_map.dart';
import 'model/marker_data.dart';
import 'model/marker_manager.dart';
import 'model/marker_role.dart';

class MarkerManagersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onManagersLoaded;

  MarkerManagersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onManagersLoaded,
  });

}

class MarkerManagersLoader extends SingleComputer<String?, MarkerManagersLoaderListener>{

  @override
  String get computerName => 'MarkerManagersLoader';

  late MarkerData _marker;
  late int _pageSize;
  MarkerRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    MarkerData? marker,
    int pageSize = MarkerData.managersPageSize,
    MarkerRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(marker != null);
    _marker = marker!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (MarkerManagersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiHarcMap.getManagers(
      markerKey: _marker.key,
      pageSize: _pageSize,
      lastRole: _lastRole,
      lastUserName: _lastUserName,
      lastUserKey: _lastUserKey,
        onSuccess: (List<MarkerManager> managersPage){

          bool reloaded = _lastUserName == null && _lastUserKey == null;

          MarkerManager me = _marker.getManager(AccountData.key!)!;
          MarkerManager? loadedMe = managersPage.where((manager) => manager.key == me.key).firstOrNull;
          if(loadedMe != null) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, loadedMe);
          } else if(reloaded) {
            managersPage.removeWhere((manager) => manager.key == me.key);
            managersPage.insert(0, me);
          }

          if(reloaded)
            _marker.setAllLoadedManagers(managersPage);
          else
            _marker.addLoadedManagers(managersPage);

          for(MarkerManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onManagersLoaded?.call(managersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(MarkerManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(MarkerManagersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}