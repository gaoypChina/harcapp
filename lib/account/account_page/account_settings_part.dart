import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_start/conf_email_part.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/account/account_start/main_button.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/account/account_common/sex_input_field.dart';
import 'package:harcapp/account/ms_oauth.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';
import '../login_provider.dart';


class AccountSettingsPart extends StatefulWidget{

  final EdgeInsets? padding;

  const AccountSettingsPart({this.padding, super.key});

  @override
  State<StatefulWidget> createState() => AccountSettingsPartState();

}

class AccountSettingsPartState extends State<AccountSettingsPart>{

  InputFieldController? emailController;
  InputFieldController? passController;
  InputFieldController? passRepController;
  InputFieldController? nameController;
  InputFieldController? sexController;

  Sex? sex;

  InputFieldController? validPasswordController;

  bool? editMode;
  bool? processing;

  String? errMessage;

  void showPasswordDialog(BuildContext context) => openDialog(
      context: context,
      builder: (_) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
              child: Material(
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const TitleShortcutRowWidget(title: 'Czy to na pewno Ty?'),

                      InputFieldPassword(
                          hint: 'Hasło:',
                          controller: validPasswordController,
                          autofocus: true
                      ),

                      MainButton(
                          icon: MdiIcons.check,
                          text: 'Zapisz',
                          processing: processing,
                          onTap: () async {
                            Navigator.pop(context);
                            await hideKeyboard(context);
                            sendChangeRequest(
                                onSuccess: (){
                                  if(mounted) showAppToast(context, text: 'Zapisano');
                                  if(mounted) setState(() => editMode = false);
                                }
                            );
                          }
                      ),

                    ],
                  ),
                ),
              )
          ),
        ),
      ),
  );

  void showEmailChangedDialog(BuildContext context) => showAlertDialog(
      context,
      title: 'Ostrożnie...',
      content: 'Zmiana adresu email będzie wymagała jego ponownej weryfikacji.\n\nCzy chcesz kontynuować?',
      actionBuilder: (context) => [

        AlertDialogButton(
            text: 'Tak',
            onTap: (){
              Navigator.pop(context);
              showPasswordDialog(context);
            }
        ),

        AlertDialogButton(text: 'Nie', onTap: () => Navigator.pop(context))
      ]
  );

  void sendChangeRequest({
      void Function()? onSuccess,
      void Function()? onError,
    }) async {

    emailController!.errorText = '';
    passController!.errorText = '';
    passRepController!.errorText = '';
    nameController!.errorText = '';
    sexController!.errorText = '';
    validPasswordController!.errorText = '';

    setState(() => processing = true);

    LoginProvider loginProv = LoginProvider.of(context);

    await ApiUser.update(
        email: emailController!.text,
        password: passController!.text,
        passwordRep: passRepController!.text,
        name: nameController!.text,
        sex: sex,
        validPass: validPasswordController!.text,
        onSuccess: (String? email, String? jwt, String? name, Sex? sex) async {
          if(email != null && email != AccountData.email) {
            await AccountData.writeEmailConf(false);
            await AccountData.writeEmail(email);
            await AccountData.writeJwt(jwt);

            loginProv.notify();
            AccountData.callOnEmailConfirmChanged(false);

            if(mounted)
              pushReplacePage(context, builder: (context) => ConfEmailPart(email));
          }

          if(name != null)
            await AccountData.writeName(name);

          if(sex != null)
            await AccountData.writeSex(sex);

          validPasswordController!.text = '';
          onSuccess?.call();
        },
        onError: (Response? response){
          try{

            Map? errMap = response!.data['errors'];

            if(errMap != null) {
              emailController!.errorText = errMap[ApiUser.UPDATE_REQ_EMAIL] ?? '';
              passController!.errorText = errMap[ApiUser.UPDATE_REQ_PASSWORD] ?? '';
              passRepController!.errorText = errMap[ApiUser.UPDATE_REQ_PASSWORD_REP] ?? '';
              nameController!.errorText = errMap[ApiUser.UPDATE_REQ_NAME] ?? '';
              sexController!.errorText = errMap[ApiUser.UPDATE_REQ_SEX] ?? '';
              validPasswordController!.errorText = errMap[ApiUser.UPDATE_REQ_VALID_PASS] ?? '';
            }

            errMessage = response.data['error'];

          }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }

          validPasswordController!.text = '';
          onError?.call();
        }
    );

    if(mounted) setState(() => processing = false);


  }

  @override
  void initState() {
    emailController = InputFieldController(text: AccountData.email);
    passController = InputFieldController();
    passRepController = InputFieldController();
    nameController = InputFieldController(text: AccountData.name);
    sexController = InputFieldController();

    validPasswordController = InputFieldController();

    sex = AccountData.sex;

    editMode = false;
    processing = false;

    super.initState();
  }

  bool savable() =>
    emailController!.text.isNotEmpty && nameController!.text.isNotEmpty && sex != null;

  @override
  Widget build(BuildContext context) => ListView(
    padding: widget.padding,
    physics: const BouncingScrollPhysics(),
    children: [

      PartTemplate(
          title: 'Moje informacje',
          errorMessage: errMessage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TitleShortcutRowWidget(
                  title: 'Email',
                  leading: const SizedBox(width: Dimen.SIDE_MARG),
                  textAlign: TextAlign.start,
                  titleColor: hintEnab_(context),
                  trailing:
                  AccountData.microsoftAcc?
                  IconButton(
                    onPressed: () => showAppToast(context, text: 'Konto powiązane z Microsoft ZHP'),
                    icon: Icon(MdiIcons.microsoft, color: iconEnab_(context)),
                  ):null
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                ),
                child: Text(
                  'Adres email jest widoczny tylko dla Ciebie. Służy do weryfikacji i odzyskiwania konta.',
                  style: AppTextStyle(color: hintEnab_(context)),
                ),
              ),

              InputField(
                hint: 'Email:',
                controller: emailController,
                enabled: !AccountData.microsoftAcc && editMode!,
                maxLength: ApiUser.EMAIL_MAX_LENGTH,
                leading: Icon(MdiIcons.email, color: iconDisab_(context)),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              TitleShortcutRowWidget(
                  title: 'Ja u innych',
                  leading: const SizedBox(width: Dimen.SIDE_MARG),
                  textAlign: TextAlign.start,
                  titleColor: hintEnab_(context)
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                ),
                child: Text(
                  'Imię i nazwisko wyświetlane jest innym uczestnikom. Płeć pozwala HarcAppce dobrze odmienić niektóre słowa.'
                      '\n\n${AccountData.microsoftAcc?'Imię i nazwisko jest takie, jak w koncie ZHP.':'Imię i nazwisko można zmienić raz na 60 dni.'}',
                  style: AppTextStyle(color: hintEnab_(context)),
                ),
              ),

              InputField(
                hint: 'Imię i nazwisko:',
                controller: nameController,
                enabled: !AccountData.microsoftAcc && editMode!,
                maxLength: ApiUser.NAME_MAX_LENGTH,
                leading: Icon(MdiIcons.accountEdit, color: iconDisab_(context)),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              SexInputField(
                  sex,
                  enabled: editMode,
                  controller: sexController,
                  onSexChanged: (sex) => setState(() => this.sex = sex)
              ),

              if(AccountData.regularAcc)
                const SizedBox(height: Dimen.SIDE_MARG),

              if(AccountData.regularAcc)
                TitleShortcutRowWidget(
                    title: 'Nowe hasło',
                    leading: const SizedBox(width: Dimen.SIDE_MARG),
                    textAlign: TextAlign.start,
                    titleColor: hintEnab_(context)
                ),

              if(AccountData.regularAcc)
                InputFieldPassword(
                  hint: 'Hasło:',
                  controller: passController,
                  enabled: editMode,
                  maxLength: ApiUser.PASS_MAX_LENGTH,
                  leading: Icon(MdiIcons.key, color: iconDisab_(context)),
                ),

              if(AccountData.regularAcc)
                InputFieldPassword(
                  hint: 'Powtórz hasło:',
                  controller: passRepController,
                  enabled: editMode,
                  maxLength: ApiUser.PASS_MAX_LENGTH,
                  leading: Icon(MdiIcons.shieldKey, color: iconDisab_(context)),
                ),

              const SizedBox(height: 2*Dimen.SIDE_MARG),

              Row(
                children: [

                  Expanded(
                      child: editMode!?Hero(
                        tag: PartTemplate.secondaryButtonHeroTag,
                        child: SimpleButton.from(
                          context: context,
                          margin: EdgeInsets.zero,
                          fontWeight: weight.normal,
                          textColor: processing!?iconDisab_(context):iconEnab_(context),
                          text: 'Jednak nie',
                          icon: MdiIcons.arrowLeft,
                          onTap: (){
                            emailController!.text = AccountData.email!;
                            emailController!.errorText = '';
                            passController!.text = '';
                            nameController!.text = AccountData.name!;
                            nameController!.errorText = '';
                            sex = AccountData.sex;

                            setState(() => editMode = false);
                          },
                        ),
                      ):Container()
                  ),

                  const SizedBox(width: Dimen.SIDE_MARG),

                  Expanded(
                    child: MainButton(
                      processing: processing,
                      text: editMode!?'Zapisz':'Edytuj',
                      icon: editMode!?MdiIcons.check:MdiIcons.pencilOutline,
                      enabled: !editMode! || savable(),
                      onTap: editMode!?(){
                        hideKeyboard(context);
                        if(AccountData.microsoftAcc){
                          sendChangeRequest(
                              onSuccess: (){
                                if(mounted) showAppToast(context, text: 'Zapisano');
                                if(mounted) setState(() => editMode = false);
                              }
                          );
                          return;
                        }

                        if(emailController!.text==AccountData.email)
                          showPasswordDialog(context);
                        else
                          showEmailChangedDialog(context);
                      }:
                      (processing!?null:() => setState(() => editMode = true)),
                    ),
                  )
                ],
              ),

            ],
          )
      ),

      PartTemplate(
          title: 'Strefa zagrożenia',
          heroTag: null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TitleShortcutRowWidget(
                  title: 'Usuń konto',
                  leading: const SizedBox(width: Dimen.SIDE_MARG),
                  textAlign: TextAlign.start,
                  titleColor: hintEnab_(context)
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                ),
                child: Text(
                  'Usunięcie konta jest równoznaczne z trwałą utratą wszystkich informacji z nim związanych.\nNie ma możliwości cofnięcia tej operacji.',
                  style: AppTextStyle(color: hintEnab_(context)),
                ),
              ),

              Hero(
                tag: DeleteAccountDialog.buttonHeroTag,
                child: SimpleButton.from(
                    text: 'Usuń konto',
                    textColor: background_(context),
                    color: Colors.red,
                    onTap: () => openDialog(
                        context: context,
                        builder: (context) => DeleteAccountDialog()
                    )
                ),
              ),

            ],
          )
      ),

    ],
  );

}

class DeleteAccountDialog extends StatefulWidget{

  static const buttonHeroTag = 'deleteButtonHeroTag';

  const DeleteAccountDialog({super.key});

  @override
  State<StatefulWidget> createState() => DeleteAccountDialogState();

}

class DeleteAccountDialogState extends State<DeleteAccountDialog>{

  InputFieldController? passwordController;
  InputFieldController? emailController;
  late bool processing;

  @override
  void initState() {
    passwordController = InputFieldController();
    emailController = InputFieldController();
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              TitleShortcutRowWidget(
                  title: 'Ostrożnie!',
                  leading: const SizedBox(width: Dimen.SIDE_MARG),
                  textAlign: TextAlign.start,
                  titleColor: hintEnab_(context)
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.SIDE_MARG,
                    right: Dimen.SIDE_MARG,
                    bottom: Dimen.SIDE_MARG
                ),
                child: AppText(
                  'Usunięcie konta jest równoznaczne z trwałą utratą wszystkich informacji z nim związanych.\n<b>Nie ma możliwości cofnięcia tej operacji.</b>',
                  color: hintEnab_(context),
                ),
              ),

              if(AccountData.regularAcc)
                InputFieldPassword(
                  hint: 'Hasło',
                  controller: passwordController,
                )
              else
                InputField(
                  leading: Icon(MdiIcons.email, color: hintEnab_(context)),
                  hintTop: 'Email',
                  hint: 'Potwierdź adres email',
                  controller: emailController,
                ),

              if(AccountData.regularAcc)
                const SizedBox(height: Dimen.SIDE_MARG),

              Hero(
                tag: DeleteAccountDialog.buttonHeroTag,
                child: AnimatedChildSlider(
                  index: processing?1:0,
                  switchInCurve: Curves.easeOutQuart,
                  switchOutCurve: Curves.easeOutQuart,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SimpleButton.from(
                          text: 'Usuń konto',
                          textColor: background_(context),
                          color: Colors.red,
                          onTap: processing?null:(){

                            LoginProvider loginProv = LoginProvider.of(context);

                            if(!AccountData.regularAcc && emailController!.text != AccountData.email){
                              emailController!.errorText = 'Nie podał${AccountData.sex == Sex.male?'eś':'aś'} poprawnego adresu email';
                              return;
                            }

                            setState(() => processing = true);
                            ApiUser.delete(
                              validPass: AccountData.regularAcc?passwordController!.text:null,
                              onSuccess: () async {
                                String? email = AccountData.email;
                                await AccountData.forgetAccount();
                                await ZhpAccAuth.logout();
                                loginProv.notify();

                                if (!mounted) return;
                                showAppToast(context, text: 'Konto HarcApp <b>$email</b> trwale usunięte.');

                                Navigator.pop(context);
                                Navigator.pop(context);
                                setState(() => processing = false);
                              },
                              onError: (message){
                                if(mounted) showAppToast(context, text: 'Coś nie tak...');
                                if(mounted) passwordController!.errorText = message;
                                if(mounted) setState(() => processing = false);
                              },
                            );
                          }
                      ),
                    ),

                    SizedBox(
                      height: Dimen.ICON_SIZE + 2*Dimen.ICON_MARG + 2*SimpleButton.DEF_MARG,
                      child: SpinKitThreeBounce(
                        size: Dimen.ICON_SIZE,
                        color: iconEnab_(context),
                      ),
                    )

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ),
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

  const HarcAppWidget({this.size = defSize, this.color});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/harcapp_logo.svg',
    width: size,
    height: size,
    color: color??iconEnab_(context),
  );

}



