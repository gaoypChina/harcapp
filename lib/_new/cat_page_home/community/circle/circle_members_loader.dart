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

  const CircleMembersLoaderListener({
    super.onStart,
    super.onError,
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
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiCircle.getMembers(
        circleKey: _circle.key,
        pageSize: _pageSize,
        lastRole: _lastRole,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<Member> membersPage){

          Member me = _circle.getMember(AccountData.key!)!;
          membersPage.removeWhere((user) => user.key == me.key);
          membersPage.insert(0, me);

          bool reloaded = _lastRole == null && _lastUserName == null && _lastUserKey == null;

          if(reloaded)
            _circle.setAllLoadedMembers(membersPage);
          else
            _circle.addLoadedMembers(membersPage);

          for(CircleMembersLoaderListener listener in listeners)
            listener.onMembersLoaded?.call(membersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(CircleMembersLoaderListener listener in listeners)
            listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(CircleMembersLoaderListener listener in listeners)
            listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

    return true;
  }

}