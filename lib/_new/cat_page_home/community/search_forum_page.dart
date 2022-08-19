import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/community_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'community_group_widget_template.dart';
import 'forum/forum_loader_page.dart';
import 'forum/forum_page.dart';
import 'forum/forum_widget.dart';
import 'forum/model/post.dart';
import 'model/community.dart';

class SearchForumPage extends StatefulWidget{

  const SearchForumPage({super.key});

  @override
  State<StatefulWidget> createState() => SearchForumPageState();

}

class SearchForumPageState extends State<SearchForumPage>{

  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  List<CommunityPreviewData>? searchedCommunities;

  late TextEditingController controller;

  @override
  void initState() {

    networkAvailable = true;
    () async {
      networkAvailable = await isNetworkAvailable();
      if(mounted) setState((){});
    }();

    networkListener = addConnectionListener((hasConnection) async{
      networkAvailable = hasConnection;
      if(!mounted) return;
      setState((){});
      if(!hasConnection)
        showAppToast(context, text: 'Brak internetu');
    });

    controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
        physics:
        const BouncingScrollPhysics(),

        slivers: [
          const SliverAppBar(
            title: Text('Szukaj forów'),
            centerTitle: true,
          ),

          SliverList(delegate: SliverChildListDelegate([

            SearchField(
              hint: 'Nazwa forum:',
              controller: controller,
            )

          ])),

          searchedCommunities == null?
            const SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyMessageWidget(
                icon: MdiIcons.magnify,
                text: 'Wyszukaj fora\npo ich nazwie',
              ),
            ):
          searchedCommunities!.isEmpty?
            const SliverFillRemaining(
              hasScrollBody: false,
              child: EmptyMessageWidget(
                icon: Post.icon,
                text: 'Brak forów\no zadanej nazwie',
              ),
            ):
            SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(delegate: SliverChildBuilderDelegate(
                  (context, index) => CommunityBasicDataWidget(
                    searchedCommunities![index],
                    onForumTap: (forum){

                      if(Forum.allMap!.containsKey(forum.key))
                        pushPage(
                            context,
                            builder: (context) => ForumPage(Forum.allMap![forum.key]!)
                        );
                      else
                        pushPage(
                          context,
                          builder: (context) => ForumLoaderPage(
                            forum: forum
                          )
                        );
                    }
                  ),
                  childCount: searchedCommunities!.length
              )),
            )

        ]
    ),
    bottomNavigationBar: SimpleButton.from(
      context: context,
      icon: MdiIcons.magnify,
      text: 'Szukaj',
      onTap: () => ApiCommunity.search(
        phrase: controller.text,
        onSuccess: (result) => setState(() => searchedCommunities = result),
        onForceLoggedOut: (){
          if(!mounted) return true;
          showAppToast(context, text: forceLoggedOutMessage);
          Navigator.pop(context);
          return true;
        },
        onServerMaybeWakingUp: (){
          if(!mounted) return true;
          showServerWakingUpToast(context);
          setState(() {});
          return true;
        },
        onError: () => mounted?showAppToast(context, text: simpleErrorMessage):null,
      )
    ),
  );
  
}

class CommunityBasicDataWidget extends StatelessWidget{

  final CommunityPreviewData community;
  final void Function(ForumBasicData)? onForumTap;
  const CommunityBasicDataWidget(this.community, {this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => CommunityWidgetTemplate(
      community.iconKey,
      community.name,
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(Dimen.defMarg),
            child: ForumWidget(
              community.forum!,
              onTap:
              onForumTap == null?
              null:
              () => onForumTap?.call(community.forum!),
            ),
          ),

          if(community.forum!.followed)
            Padding(
              padding: const EdgeInsets.only(
                bottom: Dimen.defMarg,
                left: Dimen.defMarg,
                right: Dimen.defMarg
              ),
              child: Row(
                children: [

                  const Padding(
                    padding:  EdgeInsets.all(Dimen.ICON_MARG),
                    child: Icon(MdiIcons.eyeCheckOutline),
                  ),

                  Text(
                    'Obserwujesz',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: iconEnab_(context)
                    ),
                  )

                ],
              ),
            )

        ],
      )
  );

}
