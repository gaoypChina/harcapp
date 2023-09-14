import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'circle/model/circle.dart';
import 'forum/model/forum.dart';

class CommunityLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<Community>)? onCommunitiesLoaded;

  CommunityLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onCommunitiesLoaded,
  });

}

CommunitiesLoader communitiesLoader = CommunitiesLoader();
class CommunitiesLoader extends SingleComputer<String?, CommunityLoaderListener>{

  @override
  String get computerName => 'CommunitiesLoader';

  CommunitiesLoader();

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (CommunityLoaderListener listener in List.of(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
        if(!listener.toBeRemoved) listener.onNoInternet?.call();
      return;
    }

    await ApiCommunity.getAll(
        onSuccess: (List<Community> communities) async {

          List<Circle> circles = [];
          List<Forum> forums = [];

          for(Community community in communities){
            if(community.circle != null)
              circles.add(community.circle!);

            if(community.forum != null)
              forums.add(community.forum!);
          }

          Community.silentInit(communities);

          List<Future> futures = [];

          for(CommunityLoaderListener listener in listeners) {
            dynamic maybeFuture = listener.onCommunitiesLoaded?.call(communities);
            if(maybeFuture is Future) futures.add(maybeFuture);
          }
          await Future.wait(futures);
        },
      onServerMaybeWakingUp: () async {
        for(CommunityLoaderListener listener in listeners)
          if(!listener.toBeRemoved) listener.onServerMaybeWakingUp?.call();

        return true;
      },
      onForceLoggedOut: () async {
        for(CommunityLoaderListener listener in List.of(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
          if(!listener.toBeRemoved) listener.onForceLoggedOut?.call();

        return true;
      },
        onError: (resp) => callError(null),
    );

  }

}