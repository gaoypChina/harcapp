import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cover_image.dart';
import 'community_thumbnail_widget.dart';
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

  List<CommunityBasicData>? searchedCommunities;

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
                      (context, index) => CommunityBasicDataWidget(searchedCommunities![index]),
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

  final CommunityBasicData community;
  final void Function(ForumBasicData)? onForumTap;
  const CommunityBasicDataWidget(this.community, {this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      child: Material(
          clipBehavior: Clip.hardEdge,
          color: cardEnab_(context),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                  top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                ),
                child: Row(
                  children: [

                    CommunityThumbnailWidget(community.iconKey),

                    const SizedBox(width: Dimen.ICON_MARG),

                    Expanded(
                      child: Text(
                          community.name,
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              fontWeight: weight.halfBold,
                              color: iconEnab_(context)
                          )
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: Dimen.DEF_MARG,
                    right: Dimen.DEF_MARG,
                    left: Dimen.DEF_MARG
                ),
                child: ForumBasicDataWidget(community.forum!, onTap: () => onForumTap?.call(community.forum!)),
              ),

              const SizedBox(height: Dimen.DEF_MARG),


            ],
          )
      )
  );

}

class ForumBasicDataWidget extends StatelessWidget{

  static const double height = 180;

  final ForumBasicData forum;
  final void Function()? onTap;
  const ForumBasicDataWidget(this.forum, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Material(
          elevation: AppCard.bigElevation,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [

                CoverImage(forum.coverImage),

                Positioned(
                  top: 0,
                  left: 0,
                  height: Dimen.ICON_FOOTPRINT,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    color: cardEnab_(context)!.withOpacity(.7),
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppCard.BIG_RADIUS),
                        bottomRight: Radius.circular(AppCard.BIG_RADIUS),
                      ),
                      side: BorderSide(color: cardEnab_(context)!.withOpacity(.7), width: 4),
                    ),
                    child: Blur(
                        mode: TileMode.repeated,
                        sigma: 4,
                        child: Row(
                          children: [
                            const SizedBox(width: Dimen.ICON_MARG),
                            const Icon(Post.icon),
                            const SizedBox(width: Dimen.ICON_MARG),
                            Text(
                                'Forum',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold,
                                    color: iconEnab_(context)
                                )
                            ),

                            const SizedBox(width: Dimen.ICON_MARG),

                          ],
                        )
                    ),
                  ),
                ),

              ],
            ),
          )
      )
  );

}