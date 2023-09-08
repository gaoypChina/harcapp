import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/account/account_common/druzyna_input_field.dart';
import 'package:harcapp/account/account_common/hufiec_input_field.dart';
import 'package:harcapp/account/account_common/rank_harc_input_field.dart';
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
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_app_common/accounts/user_data.dart';
import '../account_common/org_input_field.dart';
import '../account_common/rank_instr_input_field.dart';
import 'input_field_controller.dart';
import 'main_button.dart';

class RegisterMicrosoftAddDataPart extends StatefulWidget{

  final String? azureToken;
  final void Function()? onAbandon;

  const RegisterMicrosoftAddDataPart(this.azureToken, {this.onAbandon});

  @override
  State<StatefulWidget> createState() => _RegisterMicrosoftAddDataPartState();

}

class _RegisterMicrosoftAddDataPartState extends State<RegisterMicrosoftAddDataPart>{

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
  late bool registered;

  String? generalError;

  void registerClick() async {

    LoginProvider loginProv = LoginProvider.of(context);

    sexController.errorText = '';
    orgController.errorText = '';
    hufiecController.errorText = '';
    druzynaController.errorText = '';
    rankHarcController.errorText = '';
    rankInstrController.errorText = '';

    regulaminController.errorText = '';
    gdprController.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.registerMicrosoft(
        widget.azureToken,
        sex,
        org,
        hufiecController.text,
        druzynaController.text,
        rankHarc,
        rankInstr,
        regulaminAccept,
        gdprAccept,
        onSuccess: (
            Response response,
            String? key,
            String? jwt,
            String? email,
            String? name,
            String? nick,
            Sex? sex,
            Org? org,
            String? hufiec,
            String? druzyna,
            RankHarc? rankHarc,
            RankInstr? rankInstr,
        ) async {

          loginProv.notify();
          AccountData.callOnRegister();

          registered = true;

          if(mounted) Navigator.pop(context);
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
              sexController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_SEX] ?? '';
              orgController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_ORG] ?? '';
              hufiecController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_HUFIEC] ?? '';
              druzynaController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_DRUZYNA] ?? '';
              rankHarcController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_RANK_HARC] ?? '';
              rankInstrController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_RANK_INSTR] ?? '';

              regulaminController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_POLICY] ?? '';
              gdprController.errorText = errorFieldMap[ApiRegLog.REGISTER_MICROSOFT_REQ_GDPR] ?? '';
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
  void dispose() {

    sexController.dispose();
    orgController.dispose();
    hufiecController.dispose();
    druzynaController.dispose();
    rankHarcController.dispose();
    rankInstrController.dispose();

    if(!registered)
    widget.onAbandon?.call();
    super.dispose();
  }

  @override
  void initState() {
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
  Widget build(BuildContext context) => PageTemplate(
      child: PartTemplate(
          title: 'Ostatni krok',
          errorMessage: generalError,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: Dimen.SIDE_MARG),

              SexInputField(
                  sex,
                  controller: sexController,
                  onSexChanged: (sex) => setState(() => this.sex = sex)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              OrgInputField(
                  org,
                  controller: orgController,
                  onOrgChanged: (org) => setState(() => this.org = org)
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
                  onRankHarcChanged: (rankHarc) => setState(() => this.rankHarc = rankHarc)
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              RankInstrInputField(
                  rankInstr,
                  controller: rankInstrController,
                  onRankInstrChanged: (rankInstr) => setState(() => this.rankInstr = rankInstr)
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
                          margin: EdgeInsets.zero,
                          fontWeight: weight.normal,
                          textColor: processing!?iconDisab_(context):iconEnab_(context),
                          text: 'Rezygnuję',
                          icon: MdiIcons.close,
                          onTap: processing!?null:(){
                            Navigator.pop(context);
                            widget.onAbandon?.call();
                          },
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
