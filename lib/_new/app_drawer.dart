import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/auto_rotate.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp/_new/details/_main.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

const account = false;

class AppDrawer extends StatelessWidget{

  final Widget body;
  final Color? backgroundColor;

  const AppDrawer({required this.body, this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: backgroundColor??background_(context),
    child: SafeArea(
      child: Stack(
        children: [

          Positioned(
              bottom: -60,
              right: -60,
              child: Hero(
                tag: harcAppBigRotatLogoHero,
                child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(-45 / 360),
                    child: SvgPicture.asset(
                      'assets/images/harcapp_logo.svg',
                      width: 360,
                      height: 360,
                      color: backgroundIcon_(context),
                    )
                ),
              )
          ),

          Column(
            children: [

              const AccountHeader(),

              Expanded(
                child: Consumer<DrawerProvider>(
                  builder: (context, prov, child) => body,
                ),
              )
            ],
          )

        ],
      ),
    )
  );
}

class AccountHeaderIcon extends StatelessWidget{

  const AccountHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    if(!account)
      return IconButton(
          icon: const Icon(AppDetails.icon),
          onPressed: () => pushPage(context, builder: (context) => const AppDetails())
      );

    return Consumer<LoginProvider>(
      builder: (context, prov, child) => IconButton(
        icon: Icon(prov.loggedIn?MdiIcons.accountCircleOutline:MdiIcons.menu),
        onPressed: () => AccountHeader.open(context),
      )
    );
  }

}

class AccountHeader extends StatelessWidget{

  static const double iconSize = 54.0;

  final Widget? leading;
  const AccountHeader({this.leading, super.key});

  static const IconData icon = MdiIcons.accountCircleOutline;

  static open(BuildContext context) => openDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 305,
          child: AccountHeader(
            leading: IconButton(
              padding: const EdgeInsets.only(
                left: Dimen.ICON_MARG,
                right: Dimen.ICON_MARG
              ),
              icon: const Icon(MdiIcons.arrowLeft),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      )
  );

  @override
  Widget build(BuildContext context) => AppCard(
    elevation: AppCard.bigElevation,
    radius: AppCard.BIG_RADIUS,
    margin: AppCard.normMargin,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Row(
          children: [

            if(leading == null)
              const SizedBox(width: Dimen.ICON_FOOTPRINT)
            else
              leading!,

            Expanded(child: Container()),
            const HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
            Expanded(child: Container()),

            if(account)
              IconButton(
                  icon: const Icon(AppDetails.icon),
                  onPressed: (){
                    Navigator.pop(context);
                    pushPage(context, builder: (context) => const AppDetails());
                  }
              )
            else
              const SizedBox(width: Dimen.ICON_FOOTPRINT, height: Dimen.ICON_FOOTPRINT),

          ],
        ),

        //SizedBox(height: Dimen.ICON_MARG),

        Stack(
          children: [

            /*
            Padding(
              padding: EdgeInsets.only(top: iconSize/2 - AppCard.NORM_MARGIN_VAL),
              child:
            ),
             */

            SimpleButton(
              color: backgroundIcon_(context),
              onTap: (){
                if(!account) {
                  AppDetails.open(context);
                  return;
                }
                Navigator.pop(context);
                AccountPage.open(context);
              },
              radius: AppCard.BIG_RADIUS,
              margin: AppCard.normMargin,
              child: Row(
                children: [

                  const Padding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: account?Icon(MdiIcons.accountCircleOutline):Icon(AppDetails.icon),
                  ),

                  //SizedBox(width: Dimen.ICON_FOOTPRINT, height: Dimen.ICON_FOOTPRINT),

                  Expanded(
                    child: Text(
                      account?(AccountData.name??'Zaloguj'):'Więcej',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          fontWeight: weight.halfBold,
                          color: iconEnab_(context)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Consumer<LoginProvider>(
                    builder: (context, prov, child){

                      if(account && prov.loggedIn)
                        return const SyncWidget();

                      return const SizedBox(width: Dimen.ICON_FOOTPRINT);

                    },
                  )
                ],
              ),
            ),

            /*
            Padding(
              padding: EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Icon(MdiIcons.circle, size: iconSize, color: cardEnab_(context)),
            ),

            Padding(
              padding: EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Icon(MdiIcons.accountCircle, size: iconSize),
            ),
*/

          ],
        )





      ],
    ),
  );

}

class SyncWidget extends StatefulWidget{

  const SyncWidget({super.key});

  @override
  State<StatefulWidget> createState() => SyncWidgetState();

}

class SyncWidgetState extends State<SyncWidget>{

  static const double iconSize = Dimen.ICON_SIZE;

  SynchronizerListener? listener;
  SyncOper? syncing;

  @override
  void initState() {
    syncing = synchronizer.runningOper;
    listener = SynchronizerListener(
      onStart: (oper) => setState(() => syncing = oper),
      onEnd: (oper) => setState(() => syncing = null),
    );

    synchronizer.addListener(listener);

    super.initState();
  }

  @override
  void dispose() {
    synchronizer.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int index;
    if(syncing == SyncOper.post)
      index = 0;
    else if(syncing == SyncOper.get)
      index = 1;
    else if(!SynchronizerEngine.syncOn)
      index = 2;
    else if(SynchronizerEngine.lastSyncTimeLocal == null)
      index = 3;
    else
      index = 4;

    return AnimatedChildSlider(
      index: index,
      children: [
        IconButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              AutoRotate(
                speed: 60,
                child: Icon(MdiIcons.autorenew, size: iconSize, color: iconDisab_(context)),
              ),

              Icon(MdiIcons.arrowUpBold, color: iconDisab_(context), size: 8.0)
            ],
          ),
          onPressed: () => showAppToast(context, text: 'Trwa synchronizacja...'),
        ),

        IconButton(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              AutoRotate(
                speed: 60,
                child: Icon(MdiIcons.autorenew, size: iconSize, color: iconDisab_(context)),
              ),

              Icon(MdiIcons.arrowDownBold, color: iconDisab_(context), size: 8.0),
            ],
          ),
          onPressed: () => showAppToast(context, text: 'Trwa synchronizacja...'),
        ),

        IconButton(
          icon: Icon(MdiIcons.cloudOffOutline, size: iconSize, color: iconDisab_(context)),
          onPressed: () => showAppToast(context, text: 'Synchronizacja wyłączona'),
        ),

        IconButton(
          icon: Icon(MdiIcons.cloudQuestion, size: iconSize, color: iconDisab_(context)),
          onPressed: () => showAppToast(context, text: 'Brak synchronizacji'),
        ),

        IconButton(
          icon: Icon(MdiIcons.cloudCheck, size: iconSize, color: iconDisab_(context)),
          onPressed: () => showAppToast(context, text: 'Ostatnia synchronizacja: <b>${dateToString(SynchronizerEngine.lastSyncTimeLocal!, shortMonth: true, yearAbbr: 'A.D.')}</b>'),
        )
      ],
    );

  }

}