import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/google_form_sender.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'song_management/song.dart';

class BottomSheetReport extends StatefulWidget{

  static const int SPIEWNIK_REPORT_TEXT = 0;
  static const int SPIEWNIK_REPORT_WORD = 1;


  static const String SPIEWNIK_REPORT_TEXT_TYPE = 'Text';
  static const String SPIEWNIK_REPORT_WORD_TYPE = 'Word';

  final Song song;
  const BottomSheetReport(this.song);

  @override
  State<StatefulWidget> createState() => BottomSheetReportState();

}

class BottomSheetReportState extends State<BottomSheetReport>{

  int errorType;
  String _text;

  TextSelection _selection;

  @override
  void initState() {
    errorType = BottomSheetReport.SPIEWNIK_REPORT_TEXT;
    _text = '';
    _selection = new TextSelection(baseOffset: 0, extentOffset: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController(text: _text);
    controller.selection = _selection;
    controller.addListener((){
      setState(() => _text = controller.text);
      _selection = controller.selection;
    });

    return SingleChildScrollView(child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        AppTextFieldHint(
          controller: controller,
          maxLines: null,
          style: AppTextStyle(color: textEnab_(context)),
          hint: errorType==0?'Napisz, co nie gra:':'Podaj niejasne słowo lub zwrot:',
          hintTop: errorType==0?'Co nie gra':'Niejasne słowo',
          hintStyle: TextStyle(color: hintEnab_(context)),
          showUnderline: true,
        ),

        SizedBox(
          height: Dimen.DEF_MARG,
        ),

        RadioListTile<int>(
          title: Text(
            'Zgłoś błąd',
            style: AppTextStyle(
                color: textEnab_(context),
                fontSize: Dimen.TEXT_SIZE_NORMAL
            ),
          ),
          value: BottomSheetReport.SPIEWNIK_REPORT_TEXT,
          groupValue: errorType,
          onChanged: (int value) {
            setState(() => errorType = value);
          },
        ),
        RadioListTile<int>(
            title: Text(
                'Zgłoś trudne słowo',
                style: AppTextStyle(
                    color: textEnab_(context),
                    fontSize: Dimen.TEXT_SIZE_NORMAL
                )
            ),
            value: BottomSheetReport.SPIEWNIK_REPORT_WORD,
            groupValue: errorType,
            onChanged: (int value) {
              setState(() {
                errorType = value;
              });
            }),

        Row(
          children: <Widget>[
            Expanded(child: Container()),
            SpiewnikReportSendButton(widget.song.fileName, () => _text, getErrorType(), _text.isNotEmpty),
          ],
        )

    ],));
  }

  String getErrorType(){
    switch(errorType){
      case BottomSheetReport.SPIEWNIK_REPORT_TEXT: return BottomSheetReport.SPIEWNIK_REPORT_TEXT_TYPE;
      case BottomSheetReport.SPIEWNIK_REPORT_WORD: return BottomSheetReport.SPIEWNIK_REPORT_WORD_TYPE;
      default: return null;
    }
  }
}

class SpiewnikReportSendButton extends StatefulWidget{


  final String fileName;
  final String Function() content;
  final String errorType;
  final bool enabled;
  final Color background;

  const SpiewnikReportSendButton(this.fileName, this.content, this.errorType, this.enabled, {this.background});

  @override
  State<StatefulWidget> createState() => SpiewnikReportSendButtonState();


}

class SpiewnikReportSendButtonState extends State<SpiewnikReportSendButton>{

  bool _isSendButtonActive;
  String _buttonSendText;

  @override
  void initState() {
    _buttonSendText = 'Wyślij';
    _isSendButtonActive = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
        enabled: widget.enabled,
        padding: EdgeInsets.all(Dimen.ICON_MARG),
        onTap: widget.enabled?() {
          if (!_isSendButtonActive) return;
          GoogleFormSender sender = GoogleFormSender(
              GoogleFormSender.SONG_ERROR_FORM_URL,
              beforeSubmit: () {
                setState(() {
                  _buttonSendText = 'Wysyłanie...';
                  _isSendButtonActive = false;
                });
              },
              afterSubmit: (Response response) {
                Navigator.pop(context);
                showAppToast(context, text: 'Dzięki za zgłoszenie!');
              }
          );

          sender.addTextResponse('entry.320940762', widget.fileName);
          sender.addTextResponse('entry.1590782802', widget.errorType);
          sender.addTextResponse("entry.14528159", widget.content());

          sender.submit(saveLocalPath: getSongReportFolderLocalPath);
        }:null,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _buttonSendText,
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  color: widget.enabled?textEnab_(context):textDisab_(context),
                ),
              ),
              SizedBox(width: 12,),
              Icon(MdiIcons.send, color: widget.enabled?textEnab_(context):textDisab_(context)),
            ])
    );
  }
}