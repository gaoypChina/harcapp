import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_common/microsoft_login_button.dart';
import 'package:harcapp/account/account_start/conf_email_part.dart';
import 'package:harcapp/account/ms_oauth.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'account_nick_part.dart';
import 'account_settings_part.dart';
import '../account_start/input_field_controller.dart';
import '../account_start/login_part.dart';
import '../account_start/page_template.dart';
import '../account_common/logout.dart';


class AccountPage extends StatefulWidget{
  
  static open(BuildContext context){
    if(AccSecData.loggedIn) {
      if(AccSecData.emailConf)
        pushPage(context, builder: (context) => const AccountPage());
      else
        pushPage(context, builder: (context) => ConfEmailPart(AccSecData.email));
    }else
      pushPage(context, builder: (context) => LoginPart(
        onLoggedIn: (emailConf) {
          if(AccSecData.emailConf)
            pushReplacePage(context, builder: (context) => const AccountPage());
          else
            pushReplacePage(context, builder: (context) => ConfEmailPart(AccSecData.email));
        },
      ));
  }

  const AccountPage({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => AccountPageState();

}

class AccountPageState extends State<AccountPage> with TickerProviderStateMixin{

  InputFieldController emailController;
  InputFieldController nameController;
  InputFieldController sexController;
  InputFieldController nickController;
  InputFieldController nickSearchableController;

  bool nickSearchable;
  Sex sex;

  InputFieldController passwordController;

  bool editMode;
  bool processing;

  String errMessage;

  TabController controller;

  bool mergingMsAcc;

  @override
  void initState() {
    emailController = InputFieldController(text: AccSecData.email);
    nameController = InputFieldController(text: AccSecData.name);
    sexController = InputFieldController();
    nickController = InputFieldController(text: AccSecData.nick);
    nickSearchableController = InputFieldController();
    nickSearchable = AccSecData.nickSearchable;

    passwordController = InputFieldController();

    sex = AccSecData.sex;

    editMode = false;
    processing = false;

    controller = TabController(
      length: 2,
      vsync: this
    );

    mergingMsAcc = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageTemplate(
      title: 'Panel konta HarcApp',
      actions: [

        Consumer<ConnectivityProvider>(
            builder: (context, prov, child) => IconButton(
                icon: Icon(MdiIcons.logout),
                onPressed: prov.connected?() => openLogoutDialog(context):null
            )
        )

      ],
      appBarBottom: TabBar(
        indicator: AppTabBarIncdicator(context: context),
        physics: const BouncingScrollPhysics(),
        controller: controller,
        tabs: const [
          Tab(icon: Icon(MdiIcons.accountCog)),
          Tab(icon: Icon(MdiIcons.broadcast))
        ],
      ),
      child: Stack(
        children: [

          TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: [

              AccountSettingsPart(padding: EdgeInsets.only(top: 88.0 + (AccSecData.convertableToMicrosoft?(MicrosoftLoginButton.height + Dimen.SIDE_MARG):0))),

              AccountNickPart(padding: EdgeInsets.only(top: 88.0 + (AccSecData.convertableToMicrosoft?(MicrosoftLoginButton.height + Dimen.SIDE_MARG):0)),),

            ],
          ),

          Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: AppCard(
              radius: AppCard.BIG_RADIUS,
              margin: EdgeInsets.zero,
              color: Colors.red,
              elevation: AppCard.bigElevation,
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: AppText(
                'Konta HarcApp i wszystko z nimi związane są obecnie w <b>fazie testu</b>. Do czasu wydania wersji stabilnej, konta w każdej chwili <b>mogą zostać skasowane</b>.',
                textAlign: TextAlign.center,
                color: background_(context),
              ),
            )
          ),

          if(AccSecData.convertableToMicrosoft)
            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: MicrosoftLoginButton(
                  'Połącz z kontem ZHP',
                  trailing: mergingMsAcc?
                  const SpinKitChasingDots(color: Colors.black, size: Dimen.ICON_SIZE):
                  const Icon(MdiIcons.loginVariant, color: Colors.black),
                  onTap: () async {

                    showAlertDialog(
                      context,
                      dismissible: false,
                      title: 'Lodowanie',
                      content: 'Trwa logowanie przez konto ZHP...',
                    );

                    await ZhpAccAuth.login(context);
                    String azureToken = await ZhpAccAuth.azureToken;
                    await ApiRegLog.mergeMicrosoft(
                        azureToken,
                        onError: (err) async {
                          Navigator.pop(context);
                          await ZhpAccAuth.logout();
                          if(err.data['error'] == 'microsoft_merge_email_mismatch')
                            await showAlertDialog(
                                context,
                                title: 'To nie przejdzie...',
                                content: 'Aby połączyć konta, zaloguj się kontem ZHP o tym samym adresie email co konto HarcApp: ${AccSecData.email}.',
                                actionBuilder: (context) => [
                                  AlertDialogButton(text: 'No dobrze', onTap: () => Navigator.pop(context))
                                ]
                            );
                        },
                        onSuccess: (response){
                          Navigator.pop(context);
                          if(mounted) showAppToast(context, text: 'Połączono konto ZHP z kontem HarcApp.');
                          if(mounted) setState(() {});
                        }
                    );

                  }
              ),
            ),

        ],
      )
  );

}

class RotatingHarcAppLogo extends StatefulWidget{

  static const defSize = 48.0;

  final double size;
  final Color color;

  const RotatingHarcAppLogo({this.size = defSize, this.color});

  @override
  State<StatefulWidget> createState() => RotatingHarcAppLogoState();

}

class RotatingHarcAppLogoState extends State<RotatingHarcAppLogo>{

  static const List<Color> colors = [Colors.red, Colors.orange, Colors.amber, Colors.teal, Colors.green, Colors.blue, Colors.deepPurple];

  FlipCardController controller;

  void flip()async{
    while(true){
      if(!mounted)
        return;
      controller.toggleCard();
      setState((){
        if(colorIdx < colors.length - 2)
          colorIdx++;
        else
          colorIdx = 0;
      });
      await Future.delayed(const Duration(milliseconds: 800));
    }
  }

  int colorIdx;

  @override
  void initState() {
    controller = FlipCardController();
    colorIdx = 0;
    flip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget harcAppLogo = SvgPicture.asset(
      'assets/images/harcapp_logo.svg',
      width: widget.size,
      height: widget.size,
      color: widget.color??iconEnab_(context),
    );

    return FlipCard(
      front: HarcAppWidget(color: colors[colorIdx + 1 - (colorIdx % 2)]),
      back: HarcAppWidget(color: colors[colorIdx - (colorIdx % 2)]),
      controller: controller,
      flipOnTouch: false,
    );

  }

}

class HarcAppWidget extends StatelessWidget{

  static const defSize = 48.0;

  final double size;
  final Color color;

  const HarcAppWidget({this.size = defSize, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/harcapp_logo.svg',
      width: size,
      height: size,
      color: color??iconEnab_(context),
    );
  }

}



