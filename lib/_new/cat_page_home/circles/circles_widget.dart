import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_preview_grid.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_prompt.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_prompt_login.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'circle_loader.dart';
import 'model/circle.dart';

class CirclesWidget extends StatefulWidget{

  final bool singleLine;
  final Widget Function(List<Circle>?) circleWidgetBuilder;

  const CirclesWidget({this.singleLine = false, required this.circleWidgetBuilder, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CirclesWidgetState();

}

class CirclesWidgetState extends State<CirclesWidget>{

  bool get singleLine => widget.singleLine;
  Widget Function(List<Circle>?) get circleWidgetBuilder => widget.circleWidgetBuilder;

  late LoginProvider loginProvider;
  late LoginProviderListener loginListener;

  late CircleLoaderListener _listener;

  StreamSubscription<ConnectivityResult>? networkListener;
  late bool networkAvailable;

  @override
  void initState() {

    _listener = CircleLoaderListener(
      onError: (message) async {
        setState(() {});
      },
      onCirclesLoaded: (List<Circle> comps){
        setState(() {});
      },
    );
    circleLoader.addListener(_listener);

    loginListener = LoginProviderListener(
        onLogin: (emailConfirmed){
          if(emailConfirmed) circleLoader.run();
          else setState(() {});
        },
        onRegistered: (){
          circleLoader.run();
        },
        onEmailConfirmChanged: (emailConfirmed){
          if(emailConfirmed) circleLoader.run();
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

    if(Circle.all == null && AccountData.loggedIn)
      circleLoader.run();

    super.initState();
  }

  @override
  void dispose() {
    loginProvider.removeLoginListener(loginListener);
    circleLoader.removeListener(_listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer2<LoginProvider, CircleListProvider>(
      builder: (context, loginProv, indivCompProv, child) {

        if(!networkAvailable)
          return CirclePrompt(
            text: 'Brak internetu',
            icon: MdiIcons.earthOff,
            child: CirclePreviewGrid(singleLine: singleLine),
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
                IgnorePointer(child: CirclePrompt(
                    icon: MdiIcons.accountReactivateOutline,
                    text: 'Aktywuj konto, by współzawodniczyć',
                    child: CirclePreviewGrid(singleLine: singleLine)
                )),
              ],
            );
          else if(circleLoader.running)
            return CircleLoadingWidget(singleLine: singleLine);
          else if(Circle.all == null)
            return CirclePrompt(
              text: 'Mamy problem',
              icon: MdiIcons.closeOutline,
              child: CirclePreviewGrid(singleLine: singleLine),
            );
          else
            return circleWidgetBuilder(Circle.all);

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
              IgnorePointer(child: CirclePromptLogin(singleLine: singleLine)),
            ],
          );

      }
  );


}