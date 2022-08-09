import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'circle/model/circle.dart';
import 'forum/model/forum.dart';

class CommunityLoaderListener extends SingleComputerApiListener<String>{

  final void Function(List<Community>)? onCommunitiesLoaded;

  const CommunityLoaderListener({
    super.onStart,
    super.onError,
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
  Future<bool> perform() async {
    if(!await isNetworkAvailable())
      return false;

    await ApiCommunity.getAll(
        onSuccess: (List<Community> communities){

          List<Circle> circles = [];
          List<Forum> forums = [];

          for(Community community in communities){
            if(community.circle != null)
              circles.add(community.circle!);

            if(community.forum != null)
              forums.add(community.forum!);
          }

          Community.silentInit(communities);
          Circle.silentInit(circles);
          Forum.silentInit(forums);

          for(CommunityLoaderListener? listener in listeners)
            listener!.onCommunitiesLoaded?.call(communities);
        },
      onServerMaybeWakingUp: () async {
        for(CommunityLoaderListener? listener in listeners)
          listener!.onServerMaybeWakingUp?.call();

        return true;
      },
      onForceLoggedOut: () async {
        for(CommunityLoaderListener? listener in listeners)
          listener!.onForceLoggedOut?.call();

        return true;
      },
        onError: (resp) => callError(null),
    );

    return true;
  }

}