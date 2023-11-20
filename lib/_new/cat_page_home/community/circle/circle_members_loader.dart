import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'circle_role.dart';
import 'model/circle.dart';
import 'model/member.dart';

class CircleMembersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onMembersLoaded;

  CircleMembersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onMembersLoaded,
  });

}

class CircleMembersLoader extends SingleComputer<String?, CircleMembersLoaderListener>{

  @override
  String get computerName => 'CircleMembersLoader';

  late Circle _circle;
  late int _pageSize;
  CircleRole? _lastRole;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    Circle? circle,
    int pageSize = Circle.memberPageSize,
    CircleRole? lastRole,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(circle != null);
    _circle = circle!;
    _pageSize = pageSize;
    _lastRole = lastRole;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (CircleMembersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiCircle.getMembers(
        circleKey: _circle.key,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<Member> membersPage){

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          Member me = _circle.getMember(AccountData.key!)!;
          Member? loadedMe = membersPage.where((member) => member.key == me.key).firstOrNull;
          if(loadedMe != null) {
            membersPage.removeWhere((member) => member.key == me.key);
            membersPage.insert(0, loadedMe);
          } else if(reloaded) {
            membersPage.removeWhere((member) => member.key == me.key);
            membersPage.insert(0, me);
          }

          if(reloaded)
            _circle.setAllLoadedMembers(membersPage);
          else
            _circle.addLoadedMembers(membersPage);

          for(CircleMembersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onMembersLoaded?.call(membersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(CircleMembersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(CircleMembersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}