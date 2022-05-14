import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_tile_widget_share.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SharedRanksPage extends StatefulWidget{

  const SharedRanksPage({Key? key}) : super(key: key);

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
      showAppToast(context, text: 'Brak dostępu do Internetu');
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
        if(mounted) showAppToast(context, text: 'Coś poszło nie tak...');
      }
    );
    if(mounted) refreshController.refreshCompleted();
    setState(() => loading = false);
  }

  late LoginProvider loginProv;
  LoginProviderListener? loginListener;

  @override
  void initState() {
    refreshController = RefreshController();
    selSharedRanks = selectSharedRanks();

    loginProv = Provider.of<LoginProvider>(context, listen: false);
    loginListener = LoginProviderListener(
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

    loginProv.addLoginListener(loginListener);

    if(allSharedRanks == null) {
      loading = true;
      loadSharedRanks(resetState: false);
    }else
      loading = false;

    super.initState();
  }

  @override
  void dispose() {
    loginProv.removeLoginListener(loginListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
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
                child: Center(
                  child: SimpleButton(
                    radius: AppCard.BIG_RADIUS,
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    onTap: () => AccountPage.open(context),
                    child: const EmptyMessageWidget(
                      icon: MdiIcons.accountCircleOutline,
                      text: 'Zaloguj się,\nby przejrzeć\nudostępnione stopnie',
                    ),
                  ),
                ),
              )
            else if(loading && selSharedRanks == null)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: EmptyMessageWidget(
                    icon: MdiIcons.refresh,
                    text: 'Ładowanie...',
                  ),
                ),
              )
            else if(!loading && selSharedRanks == null)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: EmptyMessageWidget(
                    icon: MdiIcons.alertCircleOutline,
                    text: 'Problem...',
                  ),
                ),
              )
            else if(selSharedRanks!.isEmpty)
              const SliverFillRemaining(
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

}