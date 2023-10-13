import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp/_new/common/send_button.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/google_form_sender.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:package_info/package_info.dart';

import '../common.dart';


class PartReport extends StatefulWidget{

  final String _title;
  const PartReport(this._title, {super.key});

  @override
  State<StatefulWidget> createState() => PartReportState();

}

class PartReportState extends State<PartReport> with TickerProviderStateMixin{

  late bool _isSendButtonActive;

  late TextEditingController controllerReport;
  late TextEditingController controllerEmail;

  late bool bottomVisible;

  late KeyboardVisibilityController keyboardVisibilityController;

  @override
  void initState() {
    _isSendButtonActive = true;

    controllerReport = TextEditingController();
    controllerEmail = TextEditingController();

    bottomVisible = false;

    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible){
      if(mounted) setState((){/*KeyboardVisibility.isVisible*/});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    bool enabled = controllerReport.text.isNotEmpty;

    AppTextFieldHint textReport = AppTextFieldHint(
      hint: 'Opisz napotkany błąd:',
      hintTop: 'Opis błędu',
      style: AppTextStyle(color: textEnab_(context)),
      hintStyle: AppTextStyle(color: hintEnab_(context)),
      controller: controllerReport,
      onAnyChanged: (text) => setState((){}),
      maxLines: null,
      showUnderline: false,
    );

    AppTextFieldHint textEmail = AppTextFieldHint(
      hint: 'Podaj swój e-mail: *',
      hintTop: 'Email *',
      style: AppTextStyle(color: textEnab_(context)),
      hintStyle: AppTextStyle(color: hintEnab_(context)),
      controller: controllerEmail,
      onAnyChanged: (text) => setState((){}),
      maxLines: null,
      showUnderline: false,
    );


    return Stack(
      children: [

        Positioned.fill(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: part_margin, right: part_margin),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

                    const SizedBox(height: Dimen.ICON_MARG),
                    TitleShortcutRowWidget(
                      title: 'Zgłoś błąd',
                      titleColor: hintEnab_(context),
                      textAlign: TextAlign.left,
                      //icon: MdiIcons.alertCircleCheckOutline,
                      //iconColor: hintEnab_(context),
                    ),
                    const SizedBox(height: Dimen.ICON_MARG),

                    textReport,

                    textEmail,
                    Text(
                      '* Pole niewymagane.',
                      style: AppTextStyle(
                        fontWeight: weight.halfBold,
                        color: hintEnab_(context),
                        fontSize: Dimen.TEXT_SIZE_TINY,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: SendButton(
                        enabled,
                        onTap: enabled?() async {
                          if(!_isSendButtonActive) return;

                          GoogleFormSender sender = GoogleFormSender(
                              GoogleFormSender.GEN_ERROR_FORM_URL,
                              beforeSubmit: () => setState(() {
                                _isSendButtonActive = false;
                              }),
                              afterSubmit: (Response response){
                                AppScaffold.showMessage(context, 'Dzięki za zgłoszenie!');
                                Navigator.of(context).pop();
                              }
                          );

                          String platform;
                          if(Platform.isAndroid) platform = 'Android';
                          else if(Platform.isIOS) platform = 'iOS';
                          else platform = 'Other';

                          sender.addTextResponse('entry.869670923', widget._title);
                          sender.addTextResponse('entry.779437691', textReport.controller!.text);
                          sender.addTextResponse('entry.1446732755', textEmail.controller!.text);
                          sender.addTextResponse('entry.29092162', platform);
                          sender.addTextResponse('entry.384882387', (await PackageInfo.fromPlatform()).version);

                          await sender.submit(saveLocalPath: getGeneralReportFolderLocalPath);
                        }:null,
                      ),
                    ),



                  ],),

              )
          ),
        ),

        Positioned.fill(
          child: AbsorbPointer(
            absorbing: bottomVisible,
          )
        ),
      ],
    );
  }
}