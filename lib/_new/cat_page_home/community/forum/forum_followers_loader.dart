import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/forum.dart';

class ForumFollowersLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onFollowersLoaded;

  ForumFollowersLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onFollowersLoaded,
  });

}

class ForumFollowersLoader extends SingleComputer<String?, ForumFollowersLoaderListener>{

  @override
  String get computerName => 'ForumFollowersLoader';

  late Forum _forum;
  late int _pageSize;
  String? _lastUserName;
  String? _lastUserKey;

  @override
  Future<bool> run({
    bool awaitFinish = false,
    Forum? forum,
    int pageSize = Forum.managerPageSize,
    String? lastUserName,
    String? lastUserKey,
  }){
    assert(forum != null);
    _forum = forum!;
    _pageSize = pageSize;
    _lastUserName = lastUserName;
    _lastUserKey = lastUserKey;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (ForumFollowersLoaderListener listener in listeners)
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiForum.getFollowers(
        forumKey: _forum.key,
        pageSize: _pageSize,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<UserData> followersPage){
          bool reloaded = _lastUserName == null && _lastUserKey == null;

          if(reloaded)
            _forum.setAllLoadedFollowers(followersPage);
          else
            _forum.addLoadedFollowers(followersPage);

          for(ForumFollowersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onFollowersLoaded?.call(followersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(ForumFollowersLoaderListener listener in listeners)
            listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(ForumFollowersLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}