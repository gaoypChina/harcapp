import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_preview_widget.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_prompt_login.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'circle_editor/_main.dart';
import 'circle_loader.dart';
import 'circle_page.dart';
import 'circle_widget.dart';
import 'model/circle.dart';
import 'new_circle_type.dart';

class AllCirclesPage extends StatefulWidget{

  final void Function(Circle)? onCircleTap;

  const AllCirclesPage({this.onCircleTap, super.key});

  @override
  State<StatefulWidget> createState() => AllCirclesPageState();

}

class AllCirclesPageState extends State<AllCirclesPage>{

  void Function(Circle)? get onCircleTap => widget.onCircleTap;

  late RefreshController refreshController;

  late LoginListener loginListener;

  late CircleLoaderListener _listener;
  
  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  late List<Circle> searchedCircles;
  
  @override
  void initState() {
    
    refreshController = RefreshController();

    _listener = CircleLoaderListener(
      onCirclesLoaded: (List<Circle> circles){
        if(!mounted) return;

        Provider.of<CircleProvider>(context, listen: false).notify();
        Provider.of<CircleListProvider>(context, listen: false).notify();

        refreshController.refreshCompleted();
        setState(() {});
        searchedCircles = circles;
      },
      onError: (message) async {
        if(!mounted) return;

        refreshController.refreshCompleted();
        setState(() {});
      },
    );
    circleLoader.addListener(_listener);

    loginListener = LoginListener(
        onLogin: (emailConfirmed){
          if(!mounted) return;
          setState(() {});
          searchedCircles = Circle.all!;
        },
        onRegistered: (){
          if(!mounted) return;
          setState(() {});
          searchedCircles = Circle.all!;
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

    if(Circle.all == null && AccountData.loggedIn)
      circleLoader.run();

    if(Circle.all != null)
      searchedCircles = Circle.all!;

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    circleLoader.removeListener(_listener);
    refreshController.dispose();

    super.dispose();
  }
  
  void selectCircles(String text){

    if(text.isEmpty) {
      searchedCircles = Circle.all!;
      return;
    }

    List<Circle> circles = [];
    for(Circle circle in Circle.all!)
      if(remPolChars(circle.name).contains(remPolChars(text)))
        circles.add(circle);

    searchedCircles = circles;
  }

  bool get shouldScroll => AccountData.loggedIn && Circle.all != null && Circle.all!.isNotEmpty;

  List<Widget> getSlivers(){
    
    List<Widget> slivers = [];
    
    slivers.add(SliverAppBar(
      title: const Text('Kręgi'),
      centerTitle: true,
      floating: true,
      pinned: !shouldScroll,
    ));

    if(!networkAvailable)
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: CirclePreviewWidget.from(
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
          child: CirclePreviewWidget.from(
            context: context,
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            icon: MdiIcons.accountReactivateOutline,
            text: 'Aktywuj konto by\nzawiązać krąg',
            onTap: () => AccountPage.open(context),
          ),
        ));
      else if(circleLoader.running)
        slivers.add(SliverFillRemaining(
            hasScrollBody: false,
            child: CircleLoadingWidget(
                width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
                padding: const EdgeInsets.all(Dimen.SIDE_MARG)
            ),
        ));
      else if(Circle.all == null)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: CirclePreviewWidget.from(
            context: context,
            width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            icon: MdiIcons.closeOutline,
            text: 'Mamy problem'
         ),
        ));
      else if(Circle.all!.isEmpty)
        slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: CirclePreviewWidget(
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
              child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: SimpleButton(
                    onTap: () => NewCircleButton.newCircle(context),
                    elevation: AppCard.bigElevation,
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    color: cardEnab_(context),
                    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [

                        IgnorePointer(child: NewCircleButton()),

                        SizedBox(height: Dimen.SIDE_MARG),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                          child: AppText(
                            'Zawiąż krąg zastępu, drużyny lub szczepu!'
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

        if(Circle.all == null)
          widgets.add(Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: CirclePreviewWidget.from(
              context: context,
              width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
              text: 'Coś poszło nie tak',
              icon: MdiIcons.closeOutline,
            ),
          ));

        else {

          if (Circle.all!.length > 3)
            widgets.add(SearchField(
                hint: 'Szukaj kręgów:',
                onChanged: (text) => setState(() => selectCircles(text))
            ));

          widgets.add(const SizedBox(height: Dimen.SIDE_MARG));

          for (int i = 0; i < searchedCircles.length; i++) {
            widgets.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: CircleWidget(
                searchedCircles[i],
                onTap: onCircleTap,
              ),
            ));
            widgets.add(const SizedBox(height: Dimen.SIDE_MARG));
          }

          widgets.add(const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: NewCircleButton(),
          ));
        }

        slivers.add(SliverList(delegate: SliverChildListDelegate(widgets)));
      }
    }else
      slivers.add(SliverFillRemaining(
        hasScrollBody: false,
        child: CirclePromptLogin(
          width: MediaQuery.of(context).size.width - 2*Dimen.SIDE_MARG,
        )
      ));

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer2<LoginProvider, CircleListProvider>(
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

                circleLoader.run();
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

class NewCircleButton extends StatelessWidget{

  const NewCircleButton({super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Builder(
        builder: (context){

          double height = 100;

          return SizedBox(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                    color: hintEnab_(context),
                  ),

                  Positioned(
                    top: Dimen.SIDE_MARG,
                    left: Dimen.SIDE_MARG,
                    child: Icon(
                      MdiIcons.plus,
                      size: height - 2*Dimen.SIDE_MARG,
                      color: background_(context),
                    ),
                  ),

                  Positioned(
                    bottom: -1.6*height,
                    right: -.5*height,
                    height: 2.3*height,
                    width: 2.3*height,
                    child: Material(
                        borderRadius: BorderRadius.circular(2*height),
                        clipBehavior: Clip.hardEdge,
                        color: background_(context)
                    ),
                  ),

                  Positioned(
                    bottom: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    child: Text(
                        'Nowy krąg',
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR,
                            fontWeight: weight.bold,
                            color: hintEnab_(context)
                        )
                    ),
                  )

                ],
              )
          );

        },
      ),
      onTap: () => newCircle(context)
  );

  static void newCircle(BuildContext context) async {
    NewCircleType? type = await pickNewCircleType(context);
    if (type == null) return;

    if(type == NewCircleType.join)
      return;
    else
      pushPage(
        context,
        builder: (context) =>
            CircleEditorPage(
              onSaved: (comp) async {
                Circle.addToAll(context, comp);
                await pushReplacePage(context, builder: (context) => CirclePage(Circle.all!.last));
              },
            ),
      );
  }

}