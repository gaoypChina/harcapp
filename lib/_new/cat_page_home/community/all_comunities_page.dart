import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/start_widgets/communities_preview_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/start_widgets/communities_preview_widget.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/search_forum_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../account_test_widget.dart';
import '../super_search_field.dart';
import 'circle/model/circle.dart';
import 'common/community_cover_colors.dart';
import 'new_community_type.dart';
import 'community_editor/_main.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';
import 'communities_loader.dart';
import 'community_widget.dart';

class AllCommunitiesPage extends StatefulWidget{

  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;

  const AllCommunitiesPage({this.onCircleTap, this.onForumTap, super.key});

  @override
  State<StatefulWidget> createState() => AllCommunitiesPageState();

}

class AllCommunitiesPageState extends State<AllCommunitiesPage>{

  void Function(Circle)? get onCircleTap => widget.onCircleTap;
  void Function(Forum)? get onForumTap => widget.onForumTap;

  late RefreshController refreshController;

  late LoginListener loginListener;

  late CommunityLoaderListener _listener;

  @override
  void initState() {
    
    refreshController = RefreshController();

    CommunityProvider communityProv = CommunityProvider.of(context);
    CommunityListProvider communityListProv = CommunityListProvider.of(context);

    _listener = CommunityLoaderListener(
      onCommunitiesLoaded: (List<Community> communities){

        communityProv.notify();
        communityListProv.notify();

        if(!mounted) return;

        refreshController.refreshCompleted();
        setState(() {});
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        refreshController.refreshCompleted();
        showAppToast(context, text: forceLoggedOutMessage);
        setState(() {});
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        refreshController.refreshCompleted();
        showServerWakingUpToast(context);
        setState(() {});
        return true;
      },
      onError: (message) async {
        if(!mounted) return;
        refreshController.refreshCompleted();
        showAppToast(context, text: simpleErrorMessage);
        setState(() {});
      },
    );
    communitiesLoader.addListener(_listener);

    loginListener = LoginListener(
        onLogin: (emailConfirmed){
          if(!mounted) return;
          setState(() {});
        },
        onRegistered: (){
          if(!mounted) return;
          setState(() {});
        },
        onEmailConfirmChanged: (emailConfirmed){
          if(!mounted) return;
          setState(() {});
        },
        onLogout: (force){
          if(!mounted) return;
          setState((){});
        }
    );

    AccountData.addLoginListener(loginListener);

    if(Community.all == null)
      communitiesLoader.run();

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    communitiesLoader.removeListener(_listener);
    refreshController.dispose();

    super.dispose();
  }

  bool get shouldScroll => Community.all != null && Community.all!.isNotEmpty;

  List<Widget> getSlivers({required bool networkAvailable}){
    
    List<Widget> slivers = [];

    slivers.add(SliverPadding(
      padding: const EdgeInsets.only(bottom: Dimen.SIDE_MARG),
      sliver: SliverList(delegate: SliverChildListDelegate([
        const AccountTestWidget()
      ])),
    ));

    slivers.add(SliverList(delegate: SliverChildListDelegate([
      SuperSearchFieldButton(
          color: CommunityCoverColors.nonPaletteBackgroundColor(context),
          margin: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG,
          ))
    ])));

    if(!networkAvailable)
      slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CommunitiesPreviewMessageWidget(
              text: 'Brak połączenia\nz siecią',
              icon: Community.icon,
            ),
          )
      ));
    else{

      if(!AccountData.emailConf)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: CommunitiesPreviewMessageWidget(
                icon: MdiIcons.accountReactivateOutline,
                text: 'Aktywuj konto by\nzawiązać środowisko',
                onTap: () => AccountPage.open(context),
              ),
            )
        ));
      else if(communitiesLoader.running)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: CommunitiesPreviewMessageWidget(
                icon: MdiIcons.refresh,
                text: 'Ładowanie środowisk...',
              ),
            )
        ));
      else if(Community.all == null)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: CommunitiesPreviewMessageWidget(
                  icon: MdiIcons.closeOutline,
                  text: 'Mamy problem'
              ),
            )
        ));
      else if(Community.all!.isEmpty)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Column(
                children: [

                  const AppText(
                    'Zawiąż środowisko zastępu, drużyny lub szczepu!'
                        '\n\nWszystkie ważne <b>informacje i ogłoszenia</b> opublikujesz lub znajdziesz właśnie tam.',
                    size: Dimen.TEXT_SIZE_BIG,
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG),

                  const NewCommunityButton(radius: AppCard.bigRadius-4),

                  Expanded(child: Container()),

                  const CommunitiesPreviewWidget(),

                ],
              ),
            )

        ));
      else {

        List<Widget> widgets = [];

        if(Community.all == null)
          widgets.add(Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CommunitiesPreviewMessageWidget(
              text: simpleErrorMessage,
              icon: MdiIcons.closeOutline,
            ),
          ));

        else {

          for (int i = 0; i < Community.all!.length; i++) {
            widgets.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: CommunityWidget(
                Community.all![i],
                onCircleTap: onCircleTap,
                onForumTap: onForumTap,
              ),
            ));
            widgets.add(const SizedBox(height: Dimen.SIDE_MARG));
          }

          widgets.add(const Padding(
            padding: EdgeInsets.only(
              left: Dimen.SIDE_MARG,
              right: Dimen.SIDE_MARG,
              bottom: Dimen.SIDE_MARG
            ),
            child: NewCommunityButton(),
          ));
        }

        slivers.add(SliverList(delegate: SliverChildListDelegate(widgets)));
      }
    }

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer2<ConnectivityProvider, CommunityListProvider>(
      builder: (context, connProv, circleListProv, child) => ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SmartRefresher(
              enablePullDown: true,
              physics:
              shouldScroll?
              const BouncingScrollPhysics():
              const AlwaysScrollableScrollPhysics(),

              header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
              controller: refreshController,
              onRefresh: () async {

                if(!await isNetworkAvailable()){
                  showAppToast(context, text: 'Brak dostępu do Internetu');
                  refreshController.refreshCompleted();
                  return;
                }

                communitiesLoader.run();
              },
              child: CustomScrollView(
                  physics:
                  const BouncingScrollPhysics(),

                  slivers: getSlivers(networkAvailable: connProv.connected)
              )
          )
      )
  );
  
}

class NewCommunityButton extends StatelessWidget{

  static const double height = 100;
  final double radius;

  const NewCommunityButton({this.radius = communityRadius, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: radius,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Builder(
        builder: (context){

          return SizedBox(
            height: height,
            child: Material(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: CommunityCoverColors.nonPaletteBackgroundColor(context), width: Dimen.defMarg),
                borderRadius: BorderRadius.circular(radius),
              ),
              color: background_(context),
              child: Row(
                children: [

                  const SizedBox(width: (height - 72.0)/2),

                  Icon(
                    MdiIcons.plus,
                    size: 72.0,
                  ),

                  const SizedBox(width: (height - 72.0)/2),

                  Expanded(
                    child: Text(
                      'Stwórz lub dołącz do środowiska',
                      style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        fontWeight: weight.halfBold,
                        color: iconEnab_(context)
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );

        },
      ),
      onTap: () => newCommunity(context)
  );

  static void newCommunity(BuildContext context) async {

    JoinOrCreateType? type = await pickJoinCreateType(context);
    if (type == null) return;

    if(type == JoinOrCreateType.joinCircle)
      // All the logic is handled by the pickNewCommunityType() function.
      return;
    else if(type == JoinOrCreateType.searchForum)
      pushPage(
        context,
        builder: (context) => const SearchForumPage(),
      );
    else if(type == JoinOrCreateType.newCommunity)
      pushPage(
        context,
        builder: (context) =>
            CommunityEditorPage(
              onSaved: (community) async {
                Community.addToAll(community, context: context);
              },
            ),
      );
    
  }

}