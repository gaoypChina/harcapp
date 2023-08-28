import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/rank_tile_widget_share.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SharedRanksPage extends StatefulWidget{

  const SharedRanksPage({super.key});

  @override
  State<StatefulWidget> createState() => SharedRanksPageState();

}

class SharedRanksPageState extends State<SharedRanksPage>{

  static List<SharedRankMetaData>? allSharedRanks;
  List<SharedRankMetaData>? selSharedRanks;

  late RefreshController refreshController;
  late bool loading;

  List<SharedRankMetaData>? selectSharedRanks(){
    return allSharedRanks == null?null:List.of(allSharedRanks!);
  }

  void loadSharedRanks({bool resetState = true}) async {

    if(!AccountData.loggedIn)
      return;

    if(!await isNetworkAvailable()){
      if(!mounted) return;
      showAppToast(context, text: noInternetMessage);
      refreshController.refreshCompleted();
      loading = false;
      return;
    }

    if(resetState) setState(() => loading = true);
    else loading = true;

    await ApiRank.getAllShared(
      onSuccess: (sharedRanks){
        allSharedRanks = sharedRanks;
        selSharedRanks = selectSharedRanks();
      },
      onError: (){
        allSharedRanks = null;
        selSharedRanks = selectSharedRanks();
        if(mounted) showAppToast(context, text: simpleErrorMessage);
      }
    );
    if(mounted) refreshController.refreshCompleted();
    setState(() => loading = false);
  }

  late LoginListener loginListener;

  @override
  void initState() {
    refreshController = RefreshController();
    selSharedRanks = selectSharedRanks();

    loginListener = LoginListener(
      onLogin: (conf){
        if(!conf) return;
        setState(() {});
        loadSharedRanks();
      },
      onEmailConfirmChanged: (conf){
        if(!conf) return;
        setState(() {});
        loadSharedRanks();
      },
      onRegistered: (){
        setState(() {});
        loadSharedRanks();
      }
    );

    AccountData.addLoginListener(loginListener);

    if(allSharedRanks == null) {
      loading = true;
      loadSharedRanks(resetState: false);
    }else
      loading = false;

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: SmartRefresher(
      enablePullDown: AccountData.loggedIn,
      physics: const BouncingScrollPhysics(),
      header: const MaterialClassicHeader(),
      controller: refreshController,
      onRefresh: loadSharedRanks,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            floating: true,
            pinned: true,
            centerTitle: true,
            title: Text('Udostępnione mi stopnie'),
          ),

          if(!AccountData.loggedIn)
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Center(
                child: SimpleButton(
                  radius: AppCard.bigRadius,
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  onTap: () => AccountPage.open(context),
                  child: EmptyMessageWidget(
                    icon: MdiIcons.accountCircleOutline,
                    text: 'Zaloguj się,\nby przejrzeć\nudostępnione stopnie',
                  ),
                ),
              ),
            )
          else if(loading && selSharedRanks == null)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: EmptyMessageWidget(
                  icon: MdiIcons.refresh,
                  text: 'Ładowanie...',
                ),
              ),
            )
          else if(!loading && selSharedRanks == null)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: EmptyMessageWidget(
                    icon: MdiIcons.alertCircleOutline,
                    text: 'Problem...',
                  ),
                ),
              )
            else if(selSharedRanks!.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: EmptyMessageWidget(
                      icon: MdiIcons.shareVariantOutline,
                      text: 'Brak udostępnionych\nCi stopni.',
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                          (context, index) => RankTileWidgetShare(selSharedRanks![index]),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                      count: selSharedRanks!.length
                  )),
                )

        ],
      ),
    ),
  );

}