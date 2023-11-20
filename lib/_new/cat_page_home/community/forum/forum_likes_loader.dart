import 'dart:async';

import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'model/forum.dart';

class ForumLikesLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<UserData>, bool)? onLikesLoaded;

  ForumLikesLoaderListener({
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
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiForum.getLikes(
        forumKey: _forum.key,
        pageSize: _pageSize,
        lastUserName: _lastUserName,
        lastUserKey: _lastUserKey,
        onSuccess: (List<UserData> likesPage){

          bool reloaded = _lastUserName == null && _lastUserKey == null;

          if(reloaded)
            _forum.setAllLoadedLikes(likesPage);
          else
            _forum.addLoadedLikes(likesPage);

          for(ForumLikesLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onLikesLoaded?.call(likesPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(ForumLikesLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(ForumLikesLoaderListener listener in listeners)
            if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callKnownError(null),
    );

  }

}