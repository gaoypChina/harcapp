import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_common/microsoft_login_button.dart';
import 'package:harcapp/account/account_start/conf_email_part.dart';
import 'package:harcapp/account/ms_oauth.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';
import 'account_settings_part.dart';
import '../account_start/input_field_controller.dart';
import '../account_start/login_part.dart';
import '../account_start/page_template.dart';
import '../account_common/logout.dart';


class AccountPage extends StatefulWidget{
  
  static open(BuildContext context){
    if(AccountData.loggedIn) {
      if(AccountData.emailConf)
        pushPage(context, builder: (context) => const AccountPage());
      else
        pushPage(context, builder: (context) => ConfEmailPart(AccountData.email));
    }else
      pushPage(context, builder: (context) => LoginPart(
        onLoggedIn: (emailConf) {
          if(AccountData.emailConf)
            pushReplacePage(context, builder: (context) => const AccountPage());
          else
            pushReplacePage(context, builder: (context) => ConfEmailPart(AccountData.email));
        },
      ));
  }

  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => AccountPageState();

}

class AccountPageState extends State<AccountPage> with TickerProviderStateMixin{

  InputFieldController? emailController;
  InputFieldController? nameController;
  InputFieldController? sexController;
  InputFieldController? nickController;
  InputFieldController? nickSearchableController;

  bool? nickSearchable;
  Sex? sex;

  InputFieldController? passwordController;

  bool? editMode;
  bool? processing;

  String? errMessage;

  late bool mergingMsAcc;

  @override
  void initState() {
    emailController = InputFieldController(text: AccountData.email);
    nameController = InputFieldController(text: AccountData.name);
    sexController = InputFieldController();
    nickController = InputFieldController(text: AccountData.nick);
    nickSearchableController = InputFieldController();
    nickSearchable = AccountData.nickSearchable;

    passwordController = InputFieldController();

    sex = AccountData.sex;

    editMode = false;
    processing = false;

    mergingMsAcc = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: const Text('Konto HarcApp'),
          centerTitle: true,
          floating: true,
          actions: [

            Consumer<ConnectivityProvider>(
                builder: (context, prov, child) => IconButton(
                    icon: Icon(MdiIcons.exitToApp),
                    onPressed: prov.connected?() => openLogoutDialog(context):null
                )
            )

          ],
        ),

        SliverList(delegate: SliverChildListDelegate([


          if(AccountData.convertableToMicrosoft)
            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: MicrosoftLoginButton(
                  'Połącz z kontem ZHP',
                  trailing: mergingMsAcc?
                  const SpinKitChasingDots(color: Colors.black, size: Dimen.ICON_SIZE):
                  Icon(MdiIcons.loginVariant, color: Colors.black),
                  onTap: () async {

                    showAlertDialog(
                      context,
                      dismissible: false,
                      title: 'Logowanie',
                      content: 'Trwa logowanie przez konto ZHP...',
                    );

                    await ZhpAccAuth.login();
                    String? azureToken = await ZhpAccAuth.azureToken;
                    if(azureToken == null){
                      Navigator.pop(context);
                      return;
                    }
                    await ApiRegLog.mergeMicrosoft(
                      azureToken,
                      onSuccess: (response){
                        Navigator.pop(context);
                        if(mounted) showAppToast(context, text: 'Połączono konto ZHP z kontem HarcApp.');
                        if(mounted) setState(() {});
                      },
                      onServerMaybeWakingUp: () {
                        if(mounted) showServerWakingUpToast(context);
                        return true;
                      },
                      onError: (err) async {
                        Navigator.pop(context);
                        await ZhpAccAuth.logout();
                        if(err!.data['error'] == 'microsoft_merge_email_mismatch')
                          await showAlertDialog(
                              context,
                              title: 'To nie przejdzie...',
                              content: 'Aby połączyć konta, zaloguj się kontem ZHP o tym samym adresie email co konto HarcApp: ${AccountData.email}.',
                              actionBuilder: (context) => [
                                AlertDialogButton(text: 'No dobrze', onTap: () => Navigator.pop(context))
                              ]
                          );
                        else
                          showAppToast(context, text: simpleErrorMessage);

                      },
                    );

                  }
              ),
            ),

          AccountSettingsPart(
              padding: EdgeInsets.only(
                  top: AccountData.convertableToMicrosoft?
                  (MicrosoftLoginButton.height + Dimen.SIDE_MARG):
                  Dimen.SIDE_MARG
              )
          ),

        ]))

      ],
    ),
  );

  //     PageTemplate(
  //     title: 'Panel konta HarcApp',
  //     actions: [
  //
  //       Consumer<ConnectivityProvider>(
  //           builder: (context, prov, child) => IconButton(
  //               icon: Icon(MdiIcons.exitToApp),
  //               onPressed: prov.connected?() => openLogoutDialog(context):null
  //           )
  //       )
  //
  //     ],
  //     child: Column(
  //       children: [
  //
  //         const AccountTestWidget(),
  //
  //         // Expanded(
  //         //   child: Stack(
  //         //     children: [
  //         //
  //         //       AccountSettingsPart(
  //         //           padding: EdgeInsets.only(
  //         //               top: AccountData.convertableToMicrosoft?
  //         //               (MicrosoftLoginButton.height + Dimen.SIDE_MARG):
  //         //               Dimen.SIDE_MARG
  //         //           )
  //         //       ),
  //         //
  //         //       if(AccountData.convertableToMicrosoft)
  //         //         Padding(
  //         //           padding: const EdgeInsets.all(Dimen.SIDE_MARG),
  //         //           child: MicrosoftLoginButton(
  //         //               'Połącz z kontem ZHP',
  //         //               trailing: mergingMsAcc?
  //         //               const SpinKitChasingDots(color: Colors.black, size: Dimen.ICON_SIZE):
  //         //               Icon(MdiIcons.loginVariant, color: Colors.black),
  //         //               onTap: () async {
  //         //
  //         //                 showAlertDialog(
  //         //                   context,
  //         //                   dismissible: false,
  //         //                   title: 'Logowanie',
  //         //                   content: 'Trwa logowanie przez konto ZHP...',
  //         //                 );
  //         //
  //         //                 await ZhpAccAuth.login();
  //         //                 String? azureToken = await ZhpAccAuth.azureToken;
  //         //                 if(azureToken == null){
  //         //                   Navigator.pop(context);
  //         //                   return;
  //         //                 }
  //         //                 await ApiRegLog.mergeMicrosoft(
  //         //                   azureToken,
  //         //                   onSuccess: (response){
  //         //                     Navigator.pop(context);
  //         //                     if(mounted) showAppToast(context, text: 'Połączono konto ZHP z kontem HarcApp.');
  //         //                     if(mounted) setState(() {});
  //         //                   },
  //         //                   onServerMaybeWakingUp: () {
  //         //                     if(mounted) showServerWakingUpToast(context);
  //         //                     return true;
  //         //                   },
  //         //                   onError: (err) async {
  //         //                     Navigator.pop(context);
  //         //                     await ZhpAccAuth.logout();
  //         //                     if(err!.data['error'] == 'microsoft_merge_email_mismatch')
  //         //                       await showAlertDialog(
  //         //                           context,
  //         //                           title: 'To nie przejdzie...',
  //         //                           content: 'Aby połączyć konta, zaloguj się kontem ZHP o tym samym adresie email co konto HarcApp: ${AccountData.email}.',
  //         //                           actionBuilder: (context) => [
  //         //                             AlertDialogButton(text: 'No dobrze', onTap: () => Navigator.pop(context))
  //         //                           ]
  //         //                       );
  //         //                     else
  //         //                       showAppToast(context, text: simpleErrorMessage);
  //         //
  //         //                   },
  //         //                 );
  //         //
  //         //               }
  //         //           ),
  //         //         ),
  //         //
  //         //     ],
  //         //   ),
  //         // )
  //
  //       ],
  //     )
  // );

}

class HarcAppWidget extends StatelessWidget{

  static const defSize = 48.0;

  final double size;
  final Color? color;

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



