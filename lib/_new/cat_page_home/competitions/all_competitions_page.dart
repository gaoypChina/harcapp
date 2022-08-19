import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_preview_grid.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_prompt_login.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'indiv_comp/indiv_comp_editor/_main.dart';
import 'indiv_comp/indiv_comp_page.dart';
import 'indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'indiv_comp/indiv_comp_tile.dart';
import 'new_comp_type.dart';
import 'start_widgets/indiv_comp_loading_widget.dart';
import 'indiv_comp/indiv_comp_loader.dart';
import 'indiv_comp/models/indiv_comp.dart';

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
  
  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  late List<IndivComp> searchedComps;
  
  @override
  void initState() {
    
    refreshController = RefreshController();

    IndivCompProvider indivCompProv = Provider.of<IndivCompProvider>(context, listen: false);
    IndivCompListProvider indivCompListProv = Provider.of<IndivCompListProvider>(context, listen: false);

    _listener = IndivCompLoaderListener(
      onIndivCompsLoaded: (List<IndivComp> comps){
        indivCompProv.notify();
        indivCompListProv.notify();
        if(!mounted) return;

        refreshController.refreshCompleted();
        setState(() {});
        searchedComps = comps;
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

    if(IndivComp.all == null && AccountData.loggedIn)
      indivCompLoader.run();

    if(IndivComp.all != null)
      searchedComps = IndivComp.all!;

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    indivCompLoader.removeListener(_listener);
    refreshController.dispose();

    super.dispose();
  }
  
  void selectIndivComps(String text){

    if(text.isEmpty) {
      searchedComps = IndivComp.all!;
      return;
    }

    List<IndivComp> comps = [];
    for(IndivComp comp in IndivComp.all!)
      if(remPolChars(comp.name).contains(remPolChars(text)))
        comps.add(comp);

    searchedComps = comps;
  }

  bool get shouldScroll => AccountData.loggedIn && IndivComp.all != null && IndivComp.all!.isNotEmpty;

  List<Widget> getSlivers(){
    
    List<Widget> slivers = [];
    
    slivers.add(SliverAppBar(
      title: const Text('Współzawodnictwa'),
      centerTitle: true,
      floating: true,
      pinned: !shouldScroll,
    ));

    if(!networkAvailable)
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: IndivCompPreviewGrid.from(
            context: context,
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            text: 'Brak internetu',
            icon: MdiIcons.earthOff,
          ),
        ),
      ));
    else if(AccountData.loggedIn){

      if(!AccountData.emailConf)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: IndivCompPreviewGrid.from(
              context: context,
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
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
              child: IndivCompLoadingWidget(
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            ),
          ),
        ));
      else if(IndivComp.all == null)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: IndivCompPreviewGrid.from(
                context: context,
                width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
                icon: MdiIcons.closeOutline,
                text: 'Mamy problem'
            ),
          ),
        ));
      else if(IndivComp.all!.isEmpty)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: IndivCompPreviewGrid(
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
              child: SimpleButton(
                onTap: () => NewIndivCompButton.newCompetition(context),
                elevation: AppCard.bigElevation,
                color: cardEnab_(context),
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                child: const Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: IgnorePointer(child: NewIndivCompButton()),
                ),
              )
            )
          ),
        ));
      else {

        List<Widget> widgets = [];

        if(IndivComp.all == null)
          widgets.add(Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: IndivCompPreviewGrid.from(
              context: context,
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
              text: simpleErrorMessage,
              icon: MdiIcons.closeOutline,
            ),
          ));

        else {

          if (IndivComp.all!.length > 3)
            widgets.add(SearchField(
                hint: 'Szukaj współzawodnictw:',
                onChanged: (text) => setState(() => selectIndivComps(text))
            ));

          if (IndivComp.all!.length > 3)
            widgets.add(const SizedBox(height: Dimen.SIDE_MARG));

          for (int i = 0; i < searchedComps.length; i++) {
            widgets.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: IndivCompTile(
                searchedComps[i],
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
    }else
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: IndivCompPromptLogin(
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
          )
        ),
      ));

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer2<LoginProvider, IndivCompListProvider>(
      builder: (context, loginProv, indivCompProv, child) => ScrollConfiguration(
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

                indivCompLoader.run();
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
                  borderRadius: BorderRadius.circular(IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.innerRadiusSizeFactor,),
                  color: background_(context),
                  child: GradientIcon(
                    MdiIcons.plus,
                    size: IndivCompThumbnailWidget.defSize * IndivCompThumbnailWidget.iconSizeFactor,
                    colorStart: hintEnab_(context),
                    colorEnd: textEnab_(context),
                  )
                ),
              )
            ),
          ),

          const SizedBox(width: Dimen.SIDE_MARG),

          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Nowe',
                style: AppTextStyle(
                  fontSize: IndivCompTile.textSizePkt,
                  color: hintEnab_(context),
                  fontWeight: weight.bold
                )
              ),

              Text('współzawodnictwo',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR,
                  color: hintEnab_(context),
                  fontWeight: weight.bold
                )
              )

            ],
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

              onSaved: (comp) async {
                IndivComp.addToAll(comp, context: context);
                pushReplacePage(context, builder: (context) => IndivCompPage(IndivComp.all!.last));
              },
            ),
      );
  }

}