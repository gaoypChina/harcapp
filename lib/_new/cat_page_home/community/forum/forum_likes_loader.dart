import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/forum.dart';

class ForumLikesLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onLikesLoaded;

  const ForumLikesLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onLikesLoaded,
  });

}

class ForumLikesLoader extends SingleComputer<String?, ForumLikesLoaderListener>{

  @override
  String get computerName => 'ForumLikesLoader';

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
      for (ForumLikesLoaderListener listener in listeners)
        listener.onNoInternet?.call();
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

          for(ForumLikesLoaderListener listener in listeners)
            listener.onLikesLoaded?.call(followersPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(ForumLikesLoaderListener listener in listeners)
            listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(ForumLikesLoaderListener listener in listeners)
            listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

  }

}