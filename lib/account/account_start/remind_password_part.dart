import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/account/account_start/remind_password_code_part.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'input_field_controller.dart';
import 'login_part.dart';
import 'main_button.dart';

class RemindPasswordPart extends StatefulWidget{

  final String? email;

  const RemindPasswordPart({this.email});

  @override
  State<StatefulWidget> createState() => RemindPasswordPartState();

}

class RemindPasswordPartState extends State<RemindPasswordPart>{

  InputFieldController? emailController;

  bool? processing;
  String? generalError;

  void remindPasswordClick() async {

    emailController!.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.sendResetPassReq(
        emailController!.text,
        onSuccess: (){
          if(!mounted) return;
          pushReplacePage(
              context,
              builder: (context) => RemindPasswordCodePart(emailController!.text)
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
            if(errorFieldMap != null)
              emailController!.errorText = errorFieldMap[ApiRegLog.RESET_PASSWORD_REQ_EMAIL] ?? '';

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
                  enabled: !processing!,
                  leading: Icon(MdiIcons.account, color: iconDisab_(context)),
                ),
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
                              builder: (context) => LoginPart(initEmail: emailController!.text)
                          ),
                        ),
                      )
                  ),

                  SizedBox(width: Dimen.SIDE_MARG),

                  Expanded(
                    child: MainButton(
                        processing: processing,
                        text: 'Wyślij',
                        icon: MdiIcons.emailOutline,
                        onTap: processing!?null:remindPasswordClick
                    ),
                  )
                ],
              ),

            ],
          )
      )
  );

}
