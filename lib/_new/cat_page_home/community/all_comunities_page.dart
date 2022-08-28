import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/start_widgets/communities_preview_widget.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/search_forum_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
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
import 'start_widgets/communities_loading_widget.dart';
import 'start_widgets/communities_preview_widget.dart';
import 'start_widgets/communities_prompt_login.dart';
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
  
  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

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
        onForceLogout: (){
          if(!mounted) return;
          setState((){});
        }
    );

    AccountData.addLoginListener(loginListener);

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

    if(Community.all == null && AccountData.loggedIn)
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

  bool get shouldScroll => AccountData.loggedIn && Community.all != null && Community.all!.isNotEmpty;

  List<Widget> getSlivers(){
    
    List<Widget> slivers = [];
    
    slivers.add(SliverAppBar(
      title: const Text('Środowiska'),
      centerTitle: true,
      floating: true,
      pinned: !shouldScroll,
      actions: [
        IconButton(
          icon: const Icon(MdiIcons.plus),
          onPressed: () => NewCommunityButton.newCommunity(context),
        )
      ],
    ));

    slivers.add(SliverPadding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      sliver: SliverList(delegate: SliverChildListDelegate([
        const AccountTestWidget()
      ])),
    ));

    slivers.add(SliverList(delegate: SliverChildListDelegate([
      const SuperSearchFieldButton(
          margin: EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG,
          ))
    ])));

    if(!networkAvailable)
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: CommunitiesPreviewWidget.from(
          context: context,
          width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          text: 'Brak internetu',
          icon: MdiIcons.earthOff,
        ),
      ));
    else if(AccountData.loggedIn){

      if(!AccountData.emailConf)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: CommunitiesPreviewWidget.from(
            context: context,
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            icon: MdiIcons.accountReactivateOutline,
            text: 'Aktywuj konto by\nzawiązać środowisko',
            onTap: () => AccountPage.open(context),
          ),
        ));
      else if(communitiesLoader.running)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: CommunitiesLoadingWidget(
                width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
                padding: const EdgeInsets.all(Dimen.SIDE_MARG)
            ),
        ));
      else if(Community.all == null)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: CommunitiesPreviewWidget.from(
            context: context,
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            icon: MdiIcons.closeOutline,
            text: 'Mamy problem'
         ),
        ));
      else if(Community.all!.isEmpty)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: CommunitiesPreviewWidget(
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
              child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: SimpleButton(
                    onTap: () => NewCommunityButton.newCommunity(context),
                    elevation: AppCard.bigElevation,
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    color: cardEnab_(context),
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [

                        IgnorePointer(child: NewCommunityButton()),

                        SizedBox(height: Dimen.SIDE_MARG),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                          child: AppText(
                            'Zawiąż środowisko zastępu, drużyny lub szczepu!'
                            '\n\nWszystkie ważne <b>informacje i ogłoszenia</b> opublikujesz lub znajdziesz właśnie tam.',
                            size: Dimen.TEXT_SIZE_BIG,
                          ),
                        ),

                      ],
                    )
                  )
              )
          ),
        ));
      else {

        List<Widget> widgets = [];

        if(Community.all == null)
          widgets.add(Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CommunitiesPreviewWidget.from(
              context: context,
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
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
    }else
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: CommunitiesPromptLogin(
          width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
        )
      ));

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer2<LoginProvider, CommunityListProvider>(
      builder: (context, loginProv, circleListProv, child) => ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SmartRefresher(
              enablePullDown: AccountData.loggedIn,
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

                  slivers: getSlivers()
              )
          )
      )
  );
  
}

class NewCommunityButton extends StatelessWidget{

  static const double height = 100;

  const NewCommunityButton({super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.bigRadius,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Builder(
        builder: (context){

          return SizedBox(
            height: height,
            child: Material(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: CommunityCoverColors.nonPaletteCardColor(), width: Dimen.defMarg),
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
              ),
              color: background_(context),
              child: Row(
                children: [

                  const SizedBox(width: (height - 72.0)/2),

                  const Icon(
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
        builder: (context) => SearchForumPage(),
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