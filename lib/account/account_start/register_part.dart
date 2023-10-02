import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/account/account_common/hufiec_input_field.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/account/account.dart';
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

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';
import '../../values/consts.dart';
import '../account_common/druzyna_input_field.dart';
import '../account_common/rank_harc_input_field.dart';
import '../account_common/rank_instr_input_field.dart';
import 'conf_email_part.dart';
import 'input_field_controller.dart';
import 'login_part.dart';
import 'main_button.dart';

class RegisterPart extends StatefulWidget{

  final String? initEmail;
  final String? initPassword;
  final void Function(bool accActivated)? onLoggedIn;

  const RegisterPart({this.initEmail, this.initPassword, this.onLoggedIn});

  @override
  State<StatefulWidget> createState() => RegisterPartState();

}

class RegisterPartState extends State<RegisterPart>{

  late InputFieldController emailController;
  late InputFieldController passwordController;
  late InputFieldController passwordRepController;
  late InputFieldController nameController;
  late InputFieldController sexController;
  late InputFieldController orgController;
  late InputFieldController hufiecController;
  late InputFieldController druzynaController;
  late InputFieldController rankHarcController;
  late InputFieldController rankInstrController;

  late InputFieldController gdprController;
  late InputFieldController regulaminController;

  Sex? sex;
  Org? org;
  RankHarc? rankHarc;
  RankInstr? rankInstr;
  bool? gdprAccept;
  bool? regulaminAccept;

  bool? processing;

  String? generalError;

  void registerClick() async {

    LoginProvider loginProv = LoginProvider.of(context);

    emailController.errorText = '';
    passwordController.errorText = '';
    passwordRepController.errorText = '';
    nameController.errorText = '';
    sexController.errorText = '';
    orgController.errorText = '';
    hufiecController.errorText = '';
    druzynaController.errorText = '';
    rankHarcController.errorText = '';
    rankInstrController.errorText = '';

    regulaminController.errorText = '';
    gdprController.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.register(
        emailController.text,
        nameController.text,
        sex,
        org,
        hufiecController.text,
        druzynaController.text,
        rankHarc,
        rankInstr,

        regulaminAccept,
        gdprAccept,
        passwordController.text,
        passwordRepController.text,
        onSuccess: (
            Response response,
            String? key,
            String? jwt,
            String? email,
            String? name,
            String? nick,
            Sex sex,
            Org? org,
            String? hufiec,
            String? druzyna,
            RankHarc? rankHarc,
            RankInstr? rankInstr,
        ) async {

          loginProv.notify();
          AccountData.callOnRegister();

          if(mounted) pushReplacePage(
              context,
              builder: (context) => ConfEmailPart(email)
          );
        },
        onServerMaybeWakingUp: () {
          if(mounted) showServerWakingUpToast(context);
          return true;
        },
        onError: (Response? response) async {
          if(!mounted) return;
          try {

            Map? errorFieldMap = response!.data['errors'];
            if(errorFieldMap != null) {
              emailController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_EMAIL] ?? '';
              nameController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_NAME] ?? '';
              sexController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_SEX] ?? '';
              orgController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_ORG] ?? '';
              hufiecController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_HUFIEC] ?? '';
              druzynaController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_DRUZYNA] ?? '';
              rankHarcController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_RANK_HARC] ?? '';
              rankInstrController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_RANK_INSTR] ?? '';

              passwordController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_PASSWORD] ?? '';
              passwordRepController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_PASSWORD_REP] ?? '';
              regulaminController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_POLICY] ?? '';
              gdprController.errorText = errorFieldMap[ApiRegLog.REGISTER_REQ_GDPR] ?? '';
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
    emailController = InputFieldController(text: widget.initEmail);
    passwordController = InputFieldController(text: widget.initPassword);
    passwordRepController = InputFieldController();
    nameController = InputFieldController();
    sexController = InputFieldController();
    orgController = InputFieldController();
    hufiecController = InputFieldController();
    druzynaController = InputFieldController();
    rankHarcController = InputFieldController();
    rankInstrController = InputFieldController();

    gdprController = InputFieldController();
    regulaminController = InputFieldController();

    processing = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordRepController.dispose();
    nameController.dispose();
    sexController.dispose();
    orgController.dispose();
    hufiecController.dispose();
    druzynaController.dispose();
    rankHarcController.dispose();
    rankInstrController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageTemplate(
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
                  onChanged: (sex) => setState(() => this.sex = sex)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              HufiecInputField(
                  controller: hufiecController,
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              DruzynaInputField(
                controller: druzynaController,
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              RankHarcInputField(
                  rankHarc,
                  controller: rankHarcController,
                  onChanged: (rankHarc) => setState(() => this.rankHarc = rankHarc)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              RankInstrInputField(
                  rankInstr,
                  controller: rankInstrController,
                  onChanged: (rankInstr) => setState(() => this.rankInstr = rankInstr)
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
                                initEmail: emailController.text,
                                initPassword: passwordController.text,
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
