import 'package:dio/dio.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../account.dart';
import '../account_page/account_page.dart';
import '../account_common/logout.dart';
import '../login_provider.dart';
import 'input_field_controller.dart';
import 'main_button.dart';

class ConfEmailPart extends StatefulWidget{

  final String? email;

  const ConfEmailPart(this.email, {super.key});

  @override
  State<StatefulWidget> createState() => ConfEmailPartState();

}

class ConfEmailPartState extends State<ConfEmailPart>{

  InputFieldController? confController;

  bool? processing;
  late bool processingResend;

  String? generalError;

  void confEmailClick() async {

    confController!.errorText = '';

    setState(() => processing = true);

    await ApiRegLog.carefullyConfEmail(
        context,
        confController!.text,
        onSuccess: (loggedIn){
          AccountData.writeEmailConf(true);

          Provider.of<LoginProvider>(context, listen: false).notify();
          AccountData.callOnEmailConfirmChanged(loggedIn);

          pushReplacePage(
              context,
              builder: (context) => const AccountPage()
          );
        },
        onError: (Response? response){

          Map? errorFieldMap = response!.data['errors'];
          if(errorFieldMap != null) {
            confController!.errorText = errorFieldMap[ApiRegLog.CONF_EMAIL_CONF_KEY] ?? '';
          }

          generalError = response.data['error'];
          processing = false;
          setState((){});
        }
    );

  }

  @override
  void initState() {
    confController = InputFieldController();

    processing = false;
    processingResend = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return PageTemplate(
      actions: [
        IconButton(
            icon: const Icon(MdiIcons.logout),
            onPressed: () => openLogoutDialog(context)
        )
      ],
      child: PartTemplate(
          title: 'Aktywacja konta',
          errorMessage: generalError,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              AppText(
                'Na adres <b>${widget.email}</b> wysłano kod aktywacyjny. Przepisz kod do pola poniżej.',
                size: Dimen.TEXT_SIZE_BIG,
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              InputField(
                hint: 'Kod aktywacji:',
                controller: confController,
                enabled: !processing!,
                leading: Icon(MdiIcons.accountReactivate, color: iconDisab_(context)),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: SimpleButton.from(
                  context: context,
                  fontWeight: weight.normal,
                  textColor: processingResend?iconDisab_(context):iconEnab_(context),
                  text: 'Wyśli jeszcze raz',
                  onTap: processingResend?null:()async{
                    setState(() => processingResend = true);
                    await ApiRegLog.resendActivationToken(
                      onSuccess: () => showAppToast(context, text: 'Przesłano'),
                      onError: () => showAppToast(context, text: 'Coś nie siadło.'),
                    );
                    setState(() => processingResend = false);
                  }
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
                            margin: EdgeInsets.zero,
                            fontWeight: weight.normal,
                            textColor: processing!?iconDisab_(context):iconEnab_(context),
                            text: 'Rezygnuję',
                            icon: MdiIcons.close,
                            onTap: processing!?null:() => Navigator.pop(context)
                        ),
                      )
                  ),

                  const SizedBox(width: Dimen.SIDE_MARG),

                  Expanded(
                    child: MainButton(
                      processing: processing,
                      text: 'Dalej',
                      icon: MdiIcons.arrowRight,
                      onTap: processingResend||processing!?null:confEmailClick,
                    ),
                  )
                ],
              ),

              //RotatingHarcAppLogo()

            ],
          )
      ),
    );

  }

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
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/harcapp_logo.svg',
      width: size,
      height: size,
      color: color??iconEnab_(context),
    );
  }

}