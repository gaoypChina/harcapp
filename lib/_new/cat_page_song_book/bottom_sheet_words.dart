import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'bottom_sheet_report.dart';


class BottomSheetWords extends StatefulWidget{

  final String? wordsCode;
  final String songText;
  final String fileName;

  const BottomSheetWords(this.wordsCode, this.songText, this.fileName);

  @override
  State<StatefulWidget> createState() {
    return BottomSheetWordsState();
  }
}

class BottomSheetWordsState extends State<BottomSheetWords>{

  late bool reportClicked;
  String? _text;

  @override
  void initState() {
    reportClicked = false;
    _text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: you know what to do - song errors reporting.
    Widget reportCard = AnimatedChildSlider(
      index: reportClicked?1:0,
      direction: Axis.horizontal,
      children: <Widget>[

        // child 1
        SimpleButton(
          radius: AppCard.bigRadius,
          onTap: () => setState(() => reportClicked = true),
          margin: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG),
          padding: const EdgeInsets.all(Dimen.defMarg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(MdiIcons.spellcheck, color: textEnab_(context)),
              ),
              Text(
                'Niezrozumiałe słowo?\nKliknij, by dać znać!',
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    color: textEnab_(context),
                    fontWeight: weight.halfBold
                ),
                textAlign: TextAlign.center
              ),
              const SizedBox(height: 2*Dimen.ICON_MARG,)
            ],
          ),
        ),

        // child 2
        Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Column(
            children: <Widget>[

              AppTextFieldHint(
                maxLines: null,
                style: AppTextStyle(color: textEnab_(context)),
                hint: 'Podaj niejasne słowo lub zwrot:',
                hintTop: 'Niejasne słowo',
                hintStyle: TextStyle(color: hintEnab_(context)),
                onAnyChanged: (texts) => setState(() =>_text = texts[0]),
              ),
              SpiewnikReportSendButton(
                widget.fileName,
                    () => _text,
                BottomSheetReport.SPIEWNIK_REPORT_WORD_TYPE,
                _text!.isNotEmpty,
                background: cardEnab_(context),
              )
            ],
          ),
        ),

      ],
    );


    if(widget.wordsCode == null)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(Dimen.defMarg),
            child: Text('Do tej pory nikt tu nie znalazł niejasnego słowa.', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)), textAlign: TextAlign.center,),
          ),

          const SizedBox(height: Dimen.defMarg),
          //reportCard
        ],
      );

    List<String> parts = widget.wordsCode!.split('<');
    List<String> elements = parts[0].split('>');

    Widget hardWords = Column(children: elements.map<Widget>((element) => HardWordWidget(element)).toList());
    Widget interpWidget = parts.length>1?InterpWidget(widget.songText, parts[1]):Container();

    if(parts.length==1)
      return Column(
        children: <Widget>[
          hardWords,
          //reportCard
        ],
      );
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          hardWords,
          Padding(
            padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_TITLE_MARG),
            child: Text(
                'Interpretacja',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                textAlign: TextAlign.end
            ),
          ),
          interpWidget,
          //reportCard
        ],
      );

  }

}

class InterpWidget extends StatelessWidget{
  
  final String songText;
  final String code;

  const InterpWidget(this.songText, this.code, {super.key});
  
  @override
  Widget build(BuildContext context) {

    String songText = this.songText.replaceAll('\n\n', '\n');
    songText = songText.replaceAll(Song.tabChar, '');

    List<Widget> children = [];
    
    List<String> songLines = songText.split('\n');

    List<String> parts = code.split('\n>');
    for(String part in parts){
      if(part.isNotEmpty && part.substring(0,1)=='\$'){
        children.add(Text(part.substring(1), style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, )));
      }else if(part.isNotEmpty && part.substring(0,1)=='@'){
        children.add(const SizedBox(height: 18));
        List<String> lines = part.substring(1).split('\n');

        for(String line in lines){
          int num = int.parse(line);
          children.add(Row(children: <Widget>[
            Expanded(child: Text('  ${songLines[num-1]}', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)))),
            const SizedBox(width: Dimen.defMarg),
            Text('$num', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),),
          ]));
        }
        children.add(const SizedBox(height: 6));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children
      ),
    );
  }

}

class HardWordWidget extends StatelessWidget{

  final String code;
  const HardWordWidget(this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> elements = code.split('\n');
    return Padding(
      padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(elements[0], style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: textEnab_(context)),),
              const SizedBox(width: Dimen.defMarg),
              Text('[${elements[1]}]', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context)),),
            ],
          ),
          const SizedBox(height: Dimen.defMarg),
          Text(elements[2], style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context))),
          const SizedBox(height: Dimen.defMarg),
          Text(elements[3], style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_TINY), textAlign: TextAlign.end,),

        ],
      ),
    );
  }

}