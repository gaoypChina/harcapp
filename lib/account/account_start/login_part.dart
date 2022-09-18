import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_common/microsoft_login_button.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/account/account_start/register_microsoft_add_data_part.dart';
import 'package:harcapp/account/account_start/register_part.dart';
import 'package:harcapp/account/account_start/remind_password_part.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_new/cat_page_home/community/circle/model/circle.dart';
import '../login_provider.dart';
import '../ms_oauth.dart';
import 'account_reason_page.dart';
import 'input_field_controller.dart';
import 'main_button.dart';

class LoginPart extends StatefulWidget{

  final String? initEmail;
  final String? initPassword;
  final void Function(bool? accActivated)? onLoggedIn;

  const LoginPart({this.initEmail, this.initPassword, this.onLoggedIn, super.key});

  @override
  State<StatefulWidget> createState() => LoginPartState();

}

class LoginPartState extends State<LoginPart>{

  InputFieldController? emailController;
  InputFieldController? passwordController;

  late bool processing;

  String? errMessage;

  void loginClick() async {

    LoginProvider loginProv = LoginProvider.of(context);

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);

    CommunityProvider communityProv = CommunityProvider.of(context);
    CommunityListProvider communityListProv = CommunityListProvider.of(context);

    CommunityPublishableListProvider communityPublishableListProv = CommunityPublishableListProvider.of(context);


    emailController!.errorText = '';
    passwordController!.errorText = '';

    setState(() => processing = true);

    String email = emailController!.text;
    String password = passwordController!.text;

    await ApiRegLog.carefullyLogin(
        context: context,
        email: email,
        password: password,
        onSuccess: (
            Response response,
            bool emailConf,
            bool loggedIn,
            List<IndivComp> indivComps,
            List<Community> communities,
            List<Circle> circles,
            List<Forum> forums,
            List<CommunityPublishable> feed
        ) async {

          loginProv.notify();
          AccountData.callOnLogin(emailConf);

          IndivComp.init(indivComps);
          IndivComp.callProviders(indivCompProv, indivCompListProv);

          Community.init(communities);
          Community.callProviders(communityProv, communityListProv);

          CommunityPublishable.init(feed);
          communityPublishableListProv.notify();

          if(loggedIn)
            widget.onLoggedIn?.call(emailConf);

        },
        onServerMaybeWakingUp: () {
          if(mounted) showServerWakingUpToast(context);
          return true;
        },
        onError: (Response? response){
          if(!mounted) return;
          try{

            Map? errMap = response!.data['errors'];

            if(errMap != null) {
              emailController!.errorText = errMap[ApiRegLog.LOGIN_REQ_EMAIL] ?? '';
              passwordController!.errorText = errMap[ApiRegLog.LOGIN_REQ_PASSWORD] ?? '';
            }

            errMessage = response.data['error'];

          }catch (e){
            showAppToast(context, text: simpleErrorMessage);
          }

          setState((){});
        }
      );

    if(mounted) setState(() => processing = false);

    // bool noErrors = await errRespHandler.apply(response: response);

  }

  void microsoftLoginClick() async {

    LoginProvider loginProv = LoginProvider.of(context);

    IndivCompProvider indivCompProv = IndivCompProvider.of(context);
    IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);

    CommunityProvider communityProv = CommunityProvider.of(context);
    CommunityListProvider communityListProv = CommunityListProvider.of(context);

    CommunityPublishableListProvider communityPublishableListProv = CommunityPublishableListProvider.of(context);

    try {

      showAlertDialog(
        context,
        dismissible: false,
        title: 'Logowanie',
        content: 'Trwa logowanie przez konto ZHP...',
      );

      await ZhpAccAuth.login();
      String? azureToken = await ZhpAccAuth.azureToken;
      await ApiRegLog.carefullyMicrosoftLogin(
          context: context,
          azureToken: azureToken,
          onSuccess: (Response response, bool emailConf, bool loggedIn, List<IndivComp> indivComps, List<Community> communities, List<Circle> circles, List<Forum> forums, List<CommunityPublishable> feed) async {

            loginProv.notify();
            AccountData.callOnLogin(emailConf);

            IndivComp.init(indivComps);
            IndivComp.callProviders(indivCompProv, indivCompListProv);

            Community.init(communities);
            Community.callProviders(communityProv, communityListProv);

            CommunityPublishable.init(feed);
            communityPublishableListProv.notify();

            if(mounted) await popPage(context); // close login alert dialog

            if(loggedIn)
              widget.onLoggedIn?.call(emailConf);

          },
          onServerMaybeWakingUp: () {
            if(mounted) showServerWakingUpToast(context);
            return true;
          },
          onError: (Response? response) async {
            if(!mounted) return;
            await popPage(context); // close login alert dialog
            String? respData = (response!.data as Map)['error'];

            if(respData == 'registration_required')
              pushReplacePage(context, builder: (context) => RegisterMicrosoftAddDataPart(
                azureToken, onAbandon: () => ZhpAccAuth.logout(),
              ));
            else
              showAppToast(context, text: simpleErrorMessage);

          }
      );
    } catch (e) {
      if(mounted) showAppToast(context, text: simpleErrorMessage);
      if(mounted) await popPage(context); // close login alert dialog
      await ZhpAccAuth.logout();
    }

  }

  @override
  void initState() {
    emailController = InputFieldController(text: widget.initEmail);
    passwordController = InputFieldController(text: widget.initPassword);

    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          SimpleButton(
            radius: AppCard.bigRadius,
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            margin: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            color: cardEnab_(context),
            child: SizedBox(
              height: Dimen.ICON_SIZE,
              child: Center(
                child: Text('Po co mi jakieś konto?', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: hintEnab_(context)), textAlign: TextAlign.center),
              ),
            ),
            onTap: () => pushPage(context, builder: (context) => const AccountReasonPage())
          ),

          Expanded(
            child: PartTemplate(
                title: 'Logowanie',
                errorMessage: errMessage,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Hero(
                      tag: PartTemplate.emailInputFieldHeroTag,
                      child: InputField(
                        hint: 'E-mail:',
                        controller: emailController,
                        enabled: !processing,
                        leading: Icon(MdiIcons.account, color: iconDisab_(context)),
                      ),
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Hero(
                      tag: PartTemplate.passwordInputFieldHeroTag,
                      child: InputFieldPassword(
                        hint: 'Hasło:',
                        controller: passwordController,
                        leading: Icon(MdiIcons.key, color: iconDisab_(context)),
                        enabled: !processing,
                      ),
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Align(
                      alignment: Alignment.centerRight,
                      child: SimpleButton.from(
                        context: context,
                        fontWeight: weight.normal,
                        textColor: processing?iconDisab_(context):iconEnab_(context),
                        text: 'Przypomnij hasło',
                        onTap: processing?null:() =>
                            pushReplacePage(
                                context,
                                builder: (context) => RemindPasswordPart(email: emailController!.text)
                            ),
                      ),
                    ),

                    const SizedBox(height: 2*Dimen.SIDE_MARG),

                    Row(
                      children: [

                        Expanded(
                            child: Hero(
                              tag: PartTemplate.secondaryButtonHeroTag,
                              child: SimpleButton.from(
                                context: context,
                                fontWeight: weight.normal,
                                textColor: processing?iconDisab_(context):iconEnab_(context),
                                text: 'Dołącz',
                                icon: MdiIcons.accountPlusOutline,
                                onTap: processing?null:() => pushReplacePage(
                                    context,
                                    builder: (context) => RegisterPart(
                                      initEmail: emailController!.text,
                                      initPassword: passwordController!.text,
                                    )
                                ),
                              ),
                            )
                        ),

                        const SizedBox(width: Dimen.SIDE_MARG),


                        Expanded(
                          child: MainButton(
                            icon: MdiIcons.loginVariant,
                            text: 'Zaloguj',
                            processing: processing,
                            onTap: processing?null:loginClick,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 1.5*Dimen.SIDE_MARG),

                    Material(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(MainButton.outerRadius),
                        child: Padding(
                            padding: const EdgeInsets.all(MainButton.borderSize),
                            child: MicrosoftLoginButton(
                              'Kontynuuj kontem ZHP',
                              processing: processing,
                              trailing: Consumer<ConnectivityProvider>(
                                builder: (context, prov, child) => Icon(
                                    MdiIcons.loginVariant,
                                    color:
                                    !processing && prov.connected?
                                    MicrosoftLoginButton.textEnabledColor:
                                    MicrosoftLoginButton.textDisabledColor
                                ),
                              ),
                              onTap: microsoftLoginClick
                            )
                        )
                    )

                    //RotatingHarcAppLogo()

                  ],
                )
            ),
          )

        ],
      )
  );

}

class RotatingHarcAppLogo extends StatefulWidget{

  static const defSize = 48.0;

  final double size;
  final Color? color;

  const RotatingHarcAppLogo({this.size = defSize, this.color, super.key});

  @override
  State<StatefulWidget> createState() => RotatingHarcAppLogoState();

}

class RotatingHarcAppLogoState extends State<RotatingHarcAppLogo>{

  static const List<Color> colors = [Colors.red, Colors.orange, Colors.amber, Colors.teal, Colors.green, Colors.blue, Colors.deepPurple];

  FlipCardController? controller;

  void flip()async{
    while(true){
      if(!mounted)
        return;
      controller!.toggleCard();
      setState((){
        if(colorIdx < colors.length - 2)
          colorIdx++;
        else
          colorIdx = 0;
      });
      await Future.delayed(const Duration(milliseconds: 800));
    }
  }

  late int colorIdx;

  @override
  void initState() {
    controller = FlipCardController();
    colorIdx = 0;
    flip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FlipCard(
    front: HarcAppWidget(color: colors[colorIdx + 1 - (colorIdx % 2)]),
    back: HarcAppWidget(color: colors[colorIdx - (colorIdx % 2)]),
    controller: controller,
    flipOnTouch: false,
  );

}

class HarcAppWidget extends StatelessWidget{

  static const defSize = 48.0;

  final double size;
  final Color? color;

  const HarcAppWidget({this.size = defSize, this.color, super.key});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/harcapp_logo.svg',
    width: size,
    height: size,
    color: color??iconEnab_(context),
  );

}