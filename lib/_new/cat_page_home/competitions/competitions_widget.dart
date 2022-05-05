import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
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
import 'package:pro_animated_blur/pro_animated_blur.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../app_bottom_navigator.dart';
import '../../app_drawer.dart';
import 'start_widgets/indiv_comp_loading.dart';
import 'comp_type_widget.dart';
import 'indiv_comp/indiv_comp_editor/_main.dart';
import 'indiv_comp/indiv_comp_page.dart';
import 'indiv_comp/indiv_comp_loader.dart';
import 'indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'indiv_comp/models/indiv_comp.dart';

class CompetitionsWidget extends StatefulWidget{

  final Widget Function(List<IndivComp>) competitionWidgetBuilder;

  const CompetitionsWidget({@required this.competitionWidgetBuilder, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompetitionsWidgetState();

}

class CompetitionsWidgetState extends State<CompetitionsWidget>{

  Widget Function(List<IndivComp>) get competitionWidgetBuilder => widget.competitionWidgetBuilder;

  LoginProvider loginProvider;
  LoginProviderListener loginListener;

  IndivCompLoaderListener _listener;

  StreamSubscription<ConnectivityResult> networkListener;
  bool networkAvailable;

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

    super.initState();
  }

  @override
  void dispose() {
    loginProvider.removeLoginListener(loginListener);
    indivCompLoader.removeListener(_listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer2<LoginProvider, IndivCompListProvider>(
      builder: (context, loginProv, indivCompProv, child) {

        if(!networkAvailable)
          return const IndivCompPrompt(
            child: IndivCompPreviewGrid(),
            text: 'Brak internetu',
            icon: MdiIcons.earthOff,
          );
        else if(loginProvider.loggedIn){

          if(!AccountData.emailConf)
            return Stack(
              children: [
                Positioned.fill(
                  child: SimpleButton(
                    margin: EdgeInsets.zero,
                    radius: AppCard.BIG_RADIUS,
                    onTap: () => AccountPage.open(context),
                    child: Container(),
                  ),
                ),
                const IgnorePointer(child: IndivCompPrompt(
                    child: IndivCompPreviewGrid(),
                    icon: MdiIcons.accountReactivateOutline,
                    text: 'Aktywuj konto, by współzawodniczyć'
                )),
              ],
            );
          else if(indivCompLoader.running)
            return const IndivCompLoadingWidget();
          else
            return competitionWidgetBuilder(IndivComp.all);

        }else
          return Stack(
            children: [
              Positioned.fill(
                child: SimpleButton(
                  margin: EdgeInsets.zero,
                  radius: AppCard.BIG_RADIUS,
                  onTap: () => AccountPage.open(context),
                  child: Container(),
                ),
              ),
              const IgnorePointer(child: IndivCompPromptLogin()),
            ],
          );

      }
  );


}