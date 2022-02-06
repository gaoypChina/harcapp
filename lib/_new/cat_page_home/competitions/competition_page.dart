import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_widget_small.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_preview_grid.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_prompt.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_prompt_login.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../app_bottom_navigator.dart';
import '../../app_drawer.dart';
import '../competition_preview_widget.dart';
import 'comp_type_widget.dart';
import 'indiv_comp/indiv_comp_editor/_main.dart';
import 'indiv_comp/indiv_comp_page.dart';
import 'indiv_comp/indiv_comp_loader.dart';
import 'indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'indiv_comp/models/indiv_comp.dart';

class CompetitionsPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CompetitionsPageState();

}

class CompetitionsPageState extends State<CompetitionsPage>{

  LoginProvider loginProvider;
  LoginProviderListener loginListener;

  IndivCompLoaderListener _listener;

  @override
  void initState() {

    _listener = IndivCompLoaderListener(
      onError: (message) async {
        setState(() {});
      },
      onIndivCompsLoaded: (List<IndivComp> comps){
        setState(() {});
      },
    );
    indivCompLoader.addListener(_listener);

    loginListener = LoginProviderListener(
      onLogin: (emailConfirmed){
        if(emailConfirmed) indivCompLoader.run();
        else setState(() {});
      },
      onRegistered: (){
        indivCompLoader.run();
      },
      onEmailConfirmChanged: (emailConfirmed){
        if(emailConfirmed) indivCompLoader.run();
        else setState(() {});
      }
    );

    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.addLoginListener(loginListener);

    if(IndivComp.all == null && AccSecData.loggedIn)
      indivCompLoader.run();

    super.initState();
  }

  @override
  void dispose() {
    loginProvider.removeLoginListener(loginListener);
    indivCompLoader.removeListener(_listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

//return BottomNavScaffold(
    return AppScaffold(
      body: Consumer2<LoginProvider, IndivCompListProvider>(
          builder: (context, loginProv, indivCompProv, child) {

            List<Widget> slivers = [];
            List<Widget> widgets = [];

            slivers.add(sliverAppBar());

            if(loginProvider.loggedIn){

              if(!AccSecData.emailConf)
                widgets.add(Stack(
                  children: [
                    Positioned.fill(
                      child: SimpleButton(
                        margin: EdgeInsets.zero,
                        radius: AppCard.BIG_RADIUS,
                        onTap: () => AccountPage.open(context),
                        child: Container(),
                      ),
                    ),
                    IgnorePointer(child: IndivCompPrompt(
                        child: IndivCompPreviewGrid(),
                        icon: MdiIcons.accountReactivateOutline,
                        text: 'Aktywuj konto, by współzawodniczyć'
                    )),
                  ],
                ));
              else if(indivCompLoader.running)
                widgets.add(IndivCompLoadingWidget());
              else
                return _CompListWidget();

            }else
              widgets.add(Stack(
                children: [
                  Positioned.fill(
                    child: SimpleButton(
                      margin: EdgeInsets.zero,
                      radius: AppCard.BIG_RADIUS,
                      onTap: () => AccountPage.open(context),
                      child: Container(),
                    ),
                  ),
                  IgnorePointer(child: IndivCompPromptLogin()),
                ],
              ));

            slivers.add(
                SliverList(delegate: SliverChildListDelegate(widgets))
            );

            return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: slivers
            );

          }
      ),
      bottomNavigationBar: AppBottomNavigator(),
    );
  }
}

SliverAppBar sliverAppBar() => SliverAppBar(
  leading: AccountHeaderIcon(),
  title: Text('Współzawodnictwa'),
  centerTitle: true,
  floating: true,
);

class _CompListWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _CompListWidgetState();

}

class _CompListWidgetState extends State<_CompListWidget>{

  RefreshController refreshController;

  String searchPhrase;
  List<IndivComp> searchedComps;

  IndivCompLoaderListener _listener;

  StreamSubscription<ConnectivityResult> subscription;

  bool networkAvailable;
  void establishNetwork() async {
    networkAvailable = await isNetworkAvailable();
    if(mounted) setState((){});
  }

  @override
  void initState() {
    searchedComps = IndivComp.all;
    refreshController = RefreshController();

    _listener = IndivCompLoaderListener(
      onError: (message) async {
        refreshController.refreshCompleted();
        if(mounted) setState(() {});
      },
      onIndivCompsLoaded: (List<IndivComp> comps){
        Provider.of<IndivCompProvider>(context, listen: false).notify();
        Provider.of<IndivCompListProvider>(context, listen: false).notify();

        refreshController.refreshCompleted();
        selectIndivComps(searchPhrase);
        if(mounted) setState(() {});
      },
    );

    indivCompLoader.addListener(_listener);

    networkAvailable = true;
    establishNetwork();

    subscription = addConnectionListener((hasConnection) async{
      if(hasConnection) {
        establishNetwork();
      } else {
        establishNetwork();
        if(mounted) showAppToast(context, text: 'Brak internetu');
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    indivCompLoader.removeListener(_listener);
    super.dispose();
  }

  void selectIndivComps(String text){

    if(text == null || text.isEmpty) {
      searchedComps = IndivComp.all;
      return;
    }

    List<IndivComp> comps = [];
    for(IndivComp comp in IndivComp.all)
      if(remPolChars(comp.name).contains(remPolChars(text)))
        comps.add(comp);

    searchedComps = comps;
  }

  @override
  Widget build(BuildContext context) => Consumer<IndivCompListProvider>(
      builder: (context, prov, child) {

        List<Widget> widgets = [];

        if(!networkAvailable)
          widgets.add(IndivCompPrompt(
            child: IndivCompPreviewGrid(),
            text: 'Brak internetu',
            icon: MdiIcons.earthOff,
          ));
        else if(IndivComp.all == null)
          widgets.add(IndivCompPrompt(
            child: IndivCompPreviewGrid(),
            text: 'Coś poszło nie tak',
            icon: MdiIcons.closeOutline,
          ));
        else {

          if (IndivComp.all.length > 3)
            widgets.add(SearchField(
                hint: 'Szukaj współzawodnictw:',
                onChanged: (text) => setState(() => selectIndivComps(text))
            ));

          for (int i = 0; i < searchedComps.length; i++) {
            widgets.add(Slidable(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  child: IndivCompWidgetSmall(
                    searchedComps[i],
                    showPinned: true,
                  ),
                ),
                startActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [

                    SlidableAction(
                      onPressed: (context) => setState(() => searchedComps[i].reversePinned(context)),

                      backgroundColor: background_(context),

                      foregroundColor:
                      searchedComps[i].pinned ?
                      iconEnab_(context) :
                      iconDisab_(context),

                      icon:
                      searchedComps[i].pinned ?
                      MdiIcons.pinOutline :
                      MdiIcons.pinOffOutline,

                      //label: searchedComps[index].pinned?
                      //'Przypięto':
                      //'Nie przypięto',

                      //label: 'Save',
                    ),

                  ],
                )
            ));

            widgets.add(SizedBox(height: Dimen.ICON_MARG));
          }
          if (IndivComp.all.isEmpty)
            widgets.add(IndivCompPrompt(child: IndivCompPreviewGrid()));
          else
            widgets.add(SizedBox(height: Dimen.SIDE_MARG));

          widgets.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: SimpleButton(
                radius: AppCard.BIG_RADIUS,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: Row(
                  children: [

                    SizedBox(
                      width: IndivCompThumbnailWidget.defSize,
                      height: IndivCompThumbnailWidget.defSize,
                      child: GradientWidget(
                          radius: AppCard.BIG_RADIUS,
                          colorStart: hintEnab_(context),
                          colorEnd: textEnab_(context),
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS - 4.0),
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

                    SizedBox(width: Dimen.SIDE_MARG),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Nowe',
                            style: AppTextStyle(
                                fontSize: IndivCompWidgetSmall.textSizePkt,
                                color: hintEnab_(context),
                                fontWeight: weight.bold)),

                        Text('współzawodnictwo',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR,
                                color: hintEnab_(context),
                                fontWeight: weight.bold))

                      ],
                    )

                  ],
                ),
                onTap: () async {
                  NewCompType type = await pickCompType(context);
                  if (type == null) return;

                  List<String> exampleNames = [
                    'Śmietanka towarzystwa',
                    'Liga nieprzeciętnych',
                    'Kapitol szlachty',
                    'Kto pierwszy ten lepszy',
                    'Drużyna pierścienia',
                    'Ekipa krecika',
                    'Rybki z ferajny',
                    'Zwierzogród',
                    'Załoga G',
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
                              IndivComp.addToAll(context, comp);
                              Navigator.pop(context);
                              await Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  IndivCompPage(IndivComp.all.last)));
                              setState(() {});
                            },
                          ),
                    );
                }
            ),
          ));
        }

        return SmartRefresher(
            enablePullDown: true,
            physics: BouncingScrollPhysics(),
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
                physics: BouncingScrollPhysics(),
                slivers: [

                  sliverAppBar(),

                  SliverList(delegate: SliverChildListDelegate(widgets))

                ]
            ));


      }
  );

}