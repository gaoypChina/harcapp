import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/account/account_start/remind_password_part.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'input_field_controller.dart';
import 'login_part.dart';
import 'main_button.dart';

class RemindPasswordCodePart extends StatefulWidget{

  final String email;

  const RemindPasswordCodePart(this.email);

  @override
  State<StatefulWidget> createState() => RemindPasswordCodePartState();

}

class RemindPasswordCodePartState extends State<RemindPasswordCodePart>{

  InputFieldController? emailController;
  InputFieldController? resetKeyController;
  InputFieldController? passwordController;
  InputFieldController? passwordRepController;

  late bool showPassword;
  late bool showPasswordRep;

  bool? processing;
  String? generalError;

  void remindPasswordClick() async {

    resetKeyController!.errorText = '';
    passwordController!.errorText = '';
    passwordRepController!.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.resetPass(
        email: emailController!.text,
        resetPassKey: resetKeyController!.text,
        newPass: passwordController!.text,
        newPassRep: passwordRepController!.text,
        onSuccess: () async {
          if(!mounted) return;
          showAppToast(context, text: 'Ustawiono nowe hasło');
          pushReplacePage(
              context,
              builder: (context) => LoginPart(initEmail: emailController!.text)
          );
        },
        onServerMaybeWakingUp: () {
          if(mounted) showServerWakingUpToast(context);
          return true;
        },
        onError: (Response? response){
          if(!mounted) return;
          try {

            Map? errorFieldMap = response!.data['errors'];
            if(errorFieldMap != null) {
              resetKeyController!.errorText = errorFieldMap[ApiRegLog.RESET_PASSWORD_REQ_PASS_RESET_KEY] ?? '';
              passwordController!.errorText = errorFieldMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS] ?? '';
              passwordRepController!.errorText = errorFieldMap[ApiRegLog.RESET_PASSWORD_REQ_NEW_PASS_REP] ?? '';
            }

            generalError = response.data['error'];

          }catch (e){
            showAppToast(context, text: simpleErrorMessage);
          }
          setState(() => processing = false);
        }
    );

  }
  
  @override
  void initState() {
    emailController = InputFieldController(text: widget.email);
    resetKeyController = InputFieldController();
    passwordController = InputFieldController();
    passwordRepController = InputFieldController();

    showPassword = false;
    showPasswordRep = false;

    processing = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageTemplate(
    child: PartTemplate(
        title: 'Resetuj hasło',
        errorMessage: generalError,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Hero(
              tag: PartTemplate.emailInputFieldHeroTag,
              child: InputField(
                hint: 'E-mail:',
                controller: emailController,
                enabled: false,
                leading: Icon(MdiIcons.account, color: iconDisab_(context)),
              ),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

            InputField(
              hint: 'Kod resetu hasła:',
              controller: resetKeyController,
              enabled: !processing!,
              leading: Icon(MdiIcons.account, color: iconDisab_(context)),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

            InputField(
              hint: 'Nowe hasło:',
              controller: passwordController,
              trailing: IconButton(
                icon: Icon(showPassword?MdiIcons.eyeOffOutline:MdiIcons.eyeOutline),
                onPressed: processing!?null:() => setState(() => showPassword = !showPassword),
              ),
              isPassword: !showPassword,
              enabled: !processing!,
              leading: Icon(MdiIcons.key, color: iconDisab_(context)),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

            InputField(
              hint: 'Powtórz nowe hasło:',
              controller: passwordRepController,
              trailing: IconButton(
                icon: Icon(showPasswordRep?MdiIcons.eyeOffOutline:MdiIcons.eyeOutline),
                onPressed: processing!?null:() => setState(() => showPasswordRep = !showPasswordRep),
              ),
              isPassword: !showPasswordRep,
              enabled: !processing!,
              leading: Icon(MdiIcons.shieldKey, color: iconDisab_(context)),
            ),

            SizedBox(height: 2*Dimen.SIDE_MARG),

            Row(
              children: [

                Expanded(
                    child: Hero(
                      tag: PartTemplate.secondaryButtonHeroTag,
                      child: SimpleButton.from(
                        context: context,
                        fontWeight: weight.normal,
                        text: 'Wróć',
                        icon: MdiIcons.arrowLeft,
                        onTap: processing!?null:() => pushReplacePage(
                            context,
                            builder: (context) => RemindPasswordPart(email: emailController!.text)
                        ),
                      ),
                    )
                ),

                SizedBox(width: Dimen.SIDE_MARG),

                Expanded(
                  child: MainButton(
                      processing: processing,
                      text: 'Weryfikuj',
                      icon: MdiIcons.shieldAccountOutline,
                      onTap: processing!?null:remindPasswordClick
                  ),
                )
              ],
            ),

          ],
        )
    ),
  );

}
