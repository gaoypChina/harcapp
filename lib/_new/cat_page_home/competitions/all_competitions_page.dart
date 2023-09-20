import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/account_test_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/competition_preview_grid_message.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../community/common/community_cover_colors.dart';
import '../super_search_field.dart';
import 'competition.dart';
import 'indiv_comp/indiv_comp_editor/_main.dart';
import 'indiv_comp/indiv_comp_page.dart';
import 'indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'indiv_comp/indiv_comp_tile.dart';
import 'new_comp_type.dart';
import 'indiv_comp/indiv_comp_loader.dart';
import 'indiv_comp/models/indiv_comp.dart';
import 'start_widgets/competition_preview_grid.dart';

class AllCompetitionsPage extends StatefulWidget{

  final void Function(IndivComp) onCompetitionTap;
  const AllCompetitionsPage({required this.onCompetitionTap, super.key});

  @override
  State<StatefulWidget> createState() => AllCompetitionsPageState();

}

class AllCompetitionsPageState extends State<AllCompetitionsPage>{

  void Function(IndivComp) get onCompetitionTap => widget.onCompetitionTap;

  late RefreshController refreshController;

  late LoginListener loginListener;

  late IndivCompLoaderListener _listener;

  @override
  void initState() {

    bool loggedIn = LoginProvider.of(context).loggedIn;
    bool loadInit = AccountData.emailConf && loggedIn && IndivComp.all == null;
    refreshController = RefreshController(initialRefresh: loadInit);
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(loadInit || indivCompLoader.running)
        refreshController.headerMode!.value = RefreshStatus.refreshing;
    });

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);

    _listener = IndivCompLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onIndivCompsLoaded: (List<IndivComp> comps){
        indivCompProv.notify();
        indivCompListProv.notify();
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (message) async {
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
      onEnd: (_, __){
        if(!mounted) return;
        refreshController.loadComplete();
        refreshController.refreshCompleted();
        post(() => mounted?setState(() {}):null);
      }
    );
    indivCompLoader.addListener(_listener);

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
      }
    );

    AccountData.addLoginListener(loginListener);

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    indivCompLoader.removeListener(_listener);
    refreshController.dispose();

    super.dispose();
  }

  bool get shouldScroll => IndivComp.all != null && IndivComp.all!.isNotEmpty;

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

    if(!networkAvailable)// && (IndivComp.all == null || IndivComp.all!.isEmpty))
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: CompetitionPreviewGridMessage(
            icon: Competition.icon,
            text: 'Brak połączenia\nz siecią',
          ),
        ),
      ));
    else{

      if(!AccountData.emailConf)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CompetitionPreviewGridMessage(
              icon: MdiIcons.accountReactivateOutline,
              text: 'Aktywuj konto by\nwspółzawodniczyć',
              onTap: () => AccountPage.open(context),
            ),
          ),
        ));
      else if(indivCompLoader.running)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: CompetitionPreviewGridMessage(
                icon: Competition.icon,
                text: 'Ładowanie',
              ),
            ),
        ));
      else if(IndivComp.all == null)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: CompetitionPreviewGridMessage(
                icon: MdiIcons.alertCircleOutline,
                text: 'Mamy problem'
            ),
          ),
        ));
      else if(IndivComp.all!.isEmpty)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Column(
                children: [

                  SimpleButton(
                    onTap: () => NewIndivCompButton.newCompetition(context),
                    color: cardEnab_(context),
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                    child: const Padding(
                      padding: EdgeInsets.all(Dimen.SIDE_MARG),
                      child: IgnorePointer(child: NewIndivCompButton()),
                    ),
                  ),

                  Expanded(child: Container()),

                  const CompetitionPreviewGrid()

                ],
              ),
            )
        ));
      else {

        List<Widget> widgets = [];

        if(IndivComp.all == null)
          widgets.add(Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CompetitionPreviewGridMessage(
              text: simpleErrorMessage,
              icon: MdiIcons.closeOutline,
            ),
          ));

        else {

          for (int i = 0; i < IndivComp.all!.length; i++) {
            widgets.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: IndivCompTile(
                IndivComp.all![i],
                showPinned: true,
                onTap: onCompetitionTap,
              ),
            ));
            widgets.add(const SizedBox(height: Dimen.SIDE_MARG));
          }

          widgets.add(Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(width: 2*Dimen.SIDE_MARG + IndivCompThumbnailWidget.defSize, child: Center(
              child: Icon(MdiIcons.dotsHorizontal, color: hintEnab_(context)),
            )),
          ));
          widgets.add(const SizedBox(height: Dimen.SIDE_MARG));

          widgets.add(const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: NewIndivCompButton(),
          ));
        }

        slivers.add(SliverList(delegate: SliverChildListDelegate(widgets)));
      }
    }

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer2<ConnectivityProvider, IndivCompListProvider>(
      builder: (context, connProv, indivCompProv, child) => ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SmartRefresher(
              physics:
              shouldScroll?
              const BouncingScrollPhysics():
              const AlwaysScrollableScrollPhysics(),

              header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
              controller: refreshController,
              onRefresh: () async {

                if(!await isNetworkAvailable()){
                  if(!mounted) return;
                  showAppToast(context, text: noInternetMessage);
                  refreshController.refreshCompleted();
                  return;
                }

                indivCompLoader.run();
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

class NewIndivCompButton extends StatelessWidget{

  const NewIndivCompButton({super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.bigRadius,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Row(
        children: [

          SizedBox(
            width: IndivCompThumbnailWidget.defSize,
            height: IndivCompThumbnailWidget.defSize,
            child: GradientWidget(
              radius: IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.outerRadiusSizeFactor,
              colorStart: hintEnab_(context),
              colorEnd: textEnab_(context)!,
              child: Padding(
                padding: const EdgeInsets.all(IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.borderSizeFactor),
                child: Material(
                  borderRadius: BorderRadius.circular(IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.innerRadiusSizeFactor),
                  color: background_(context),
                  child: GradientIcon(
                    MdiIcons.plusThick,
                    size: IndivCompThumbnailWidget.defSize * IndivCompThumbnailWidget.iconSizeFactor,
                    colorStart: hintEnab_(context),
                    colorEnd: textEnab_(context)!,
                  )
                ),
              )
            ),
          ),

          const SizedBox(width: Dimen.SIDE_MARG),

          Expanded(
            child: Text('Stwórz lub dołącz do współzawodnictwa',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR,
                    color: textEnab_(context),
                    fontWeight: weight.halfBold
                )
            ),
          )

        ],
      ),
      onTap: () => newCompetition(context)
  );

  static void newCompetition(BuildContext context) async {
    NewCompType? type = await pickCompType(context);
    if (type == null) return;

    List<String> exampleNames = [
      'Dolina muminków',
      'Drużyna pierścienia',
      'Ekipa krecika',
      'Kapitol szlachty',
      'Księga dżungli',
      'Kto pierwszy ten lepszy',
      'Liga nieprzeciętnych',
      'Rybki z ferajny',
      'Śmietanka towarzystwa',
      'Załoga G',
      'Zwierzogród',
    ];

    if(type == NewCompType.join)
      return;
    else
      pushPage(
        context,
        builder: (context) =>
            IndivCompEditorPage(
              initTitle: type == NewCompType.empty ? null : exampleNames[Random().nextInt(
                  exampleNames.length)],
              initTasks: type == NewCompType.empty ? null : List.of(
                  IndivComp.previewTasks),
              initAwards: type == NewCompType.empty ? null : List.of(
                  IndivComp.previewAwards),

              onSuccess: (comp) async {
                IndivComp.addToAll(comp, context: context);
                pushReplacePage(context, builder: (context) => IndivCompPage(IndivComp.all!.last));
              },
            ),
      );
  }

}