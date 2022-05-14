import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/account/account_common/gdpr_input_field.dart';
import 'package:harcapp/account/account_common/regulamin_input_field.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account_common/sex_input_field.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';
import 'conf_email_part.dart';
import 'input_field_controller.dart';
import 'login_part.dart';
import 'main_button.dart';

class RegisterPart extends StatefulWidget{

  final initEmail;
  final initPassword;
  final void Function(bool accActivated)? onLoggedIn;

  const RegisterPart({this.initEmail, this.initPassword, this.onLoggedIn});

  @override
  State<StatefulWidget> createState() => RegisterPartState();

}

class RegisterPartState extends State<RegisterPart>{

  InputFieldController? emailController;
  InputFieldController? passwordController;
  InputFieldController? passwordRepController;
  InputFieldController? nameController;
  InputFieldController? sexController;
  InputFieldController? gdprController;
  InputFieldController? regulaminController;

  Sex? sex;
  bool? gdprAccept;
  bool? regulaminAccept;

  bool? processing;

  String? generalError;

  void registerClick() async {

    emailController!.errorText = '';
    passwordController!.errorText = '';
    passwordRepController!.errorText = '';
    nameController!.errorText = '';
    sexController!.errorText = '';
    regulaminController!.errorText = '';
    gdprController!.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.register(
        emailController!.text,
        nameController!.text,
        sex,
        regulaminAccept,
        gdprAccept,
        passwordController!.text,
        passwordRepController!.text,
        onSuccess: (Response response, String? key, String? jwt, String? email, String? name, String? nick, Sex? sex) async {

          LoginProvider prov = Provider.of<LoginProvider>(context, listen: false);
          prov.callOnRegister();
          prov.notify();

          pushReplacePage(
              context,
              builder: (context) => ConfEmailPart(email)
          );
        },
        onError: (Response? response){
          try {

            Map? errorFieldMap = response!.data['errors'];
            if(errorFieldMap != null) {
              emailController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_EMAIL] ?? '';
              nameController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_NAME] ?? '';
              sexController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_SEX] ?? '';
              passwordController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_PASSWORD] ?? '';
              passwordRepController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_PASSWORD_REP] ?? '';
              regulaminController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_POLICY] ?? '';
              gdprController!.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_GDPR] ?? '';
            }

            generalError = response.data['error'];

          }catch (e){ showAppToast(context, text: 'Coś nie siadło.'); }
          setState(() => processing = false);
        }
    );

  }

  @override
  void initState() {
    emailController = InputFieldController(text: widget.initEmail);
    passwordController = InputFieldController(text: widget.initPassword);
    passwordRepController = InputFieldController();
    nameController = InputFieldController();
    sexController = InputFieldController();
    gdprController = InputFieldController();
    regulaminController = InputFieldController();

    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return PageTemplate(
      child: PartTemplate(
          title: 'Rejestracja',
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

              const SizedBox(height: Dimen.SIDE_MARG),

              InputField(
                hint: 'Imię i nazwisko:',
                controller: nameController,
                enabled: !processing!,
                leading: Icon(MdiIcons.accountEdit, color: iconDisab_(context)),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              SexInputField(
                  sex,
                  controller: sexController,
                  onSexChanged: (sex) => setState(() => this.sex = sex)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Hero(
                tag: PartTemplate.passwordInputFieldHeroTag,
                child: InputFieldPassword(
                  hint: 'Hasło:',
                  controller: passwordController,
                  leading: Icon(MdiIcons.key, color: iconDisab_(context)),
                  enabled: !processing!,
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              InputFieldPassword(
                hint: 'Powtórz hasło:',
                controller: passwordRepController,
                leading: Icon(MdiIcons.shieldKey, color: iconDisab_(context)),
                enabled: !processing!,
              ),

              const SizedBox(height: 3*Dimen.SIDE_MARG),

              Row(
                children: [
                  const SizedBox(width: Dimen.ICON_FOOTPRINT),
                  Text('Akceptuję:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context), fontWeight: weight.halfBold))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              GDPRInputField(
                  gdprAccept,
                  controller: gdprController,
                  onAcceptChanged: (accept) => setState(() => this.gdprAccept = accept)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              RegulaminInputField(
                  regulaminAccept,
                  controller: regulaminController,
                  onAcceptChanged: (accept) => setState(() => this.regulaminAccept = accept)
              ),

              const SizedBox(height: 3*Dimen.SIDE_MARG),

              Row(
                children: [

                  Expanded(
                      child: Hero(
                        tag: PartTemplate.secondaryButtonHeroTag,
                        child: SimpleButton.from(
                          context: context,
                          fontWeight: weight.normal,
                          textColor: processing!?iconDisab_(context):iconEnab_(context),
                          text: 'Loguj',
                          icon: MdiIcons.login,
                          onTap: processing!?null:() => pushReplacePage(
                              context,
                              builder: (context) => LoginPart(
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
                        processing: processing,
                        text: 'Dołącz',
                        icon: MdiIcons.accountPlusOutline,
                        onTap: processing!?null:registerClick
                    ),
                  )
                ],
              ),

              //RotatingHarcAppLogo()

            ],
          )
      )
    );

  }

}
