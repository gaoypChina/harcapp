import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/_main.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StrefaDuchaButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        TitleShortcutRowWidget(
          title: 'Strefa ducha',
          textAlign: TextAlign.start,
          onOpen: (context) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpiritPage()
              )
          ),
        ),

        SimpleButton(
          padding: EdgeInsets.zero,
          radius: AppCard.BIG_RADIUS,
          elevation: 0,
          color: cardEnab_(context),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SpiritPage()
              )
          ),
          child: Stack(
            children: [

              Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  MdiIcons.candle,
                  color: backgroundIcon_(context),
                  size: 112,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(2*Dimen.ICON_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [

                        Expanded(child: PopTextWidget()),
                        Expanded(child: PopTextWidget(delay: Duration(milliseconds: 1900))),
                        Expanded(child: PopTextWidget(delay: Duration(milliseconds: 1000))),

                      ],
                    ),

                    SizedBox(height: 3*Dimen.ICON_MARG),

                    AutoSizeText(
                      '...czy jest w życiu coś więcej?',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      ],
    );

  }

}

class PopTextWidget extends StatefulWidget{

  final Duration delay;

  const PopTextWidget({this.delay = Duration.zero});

  @override
  State<StatefulWidget> createState() => PopTextWidgetState();

}

class PopTextWidgetState extends State<PopTextWidget>{

  static const List<String> text = [
    'alkohol',
    'auto',
    'awans',
    'buty',
    'chłopak',
    'ciało',
    'ciuchy',
    'dom',
    'dziewczyna',
    'fejm',
    'forsa',
    'giełda',
    'hobby',
    'impreza',
    'inteligencja',
    'internet',
    'jacht',
    'kariera',
    'kasa',
    'komputer',
    'kot',
    'majątek',
    'małżeństwo',
    'marzenia',
    'mieszkanie',
    'moda',
    'narty',
    'odwaga',
    'ogródek',
    'pasja',
    'pies',
    'pieniądze',
    'podróże',
    'polityka',
    'praca',
    'samochód',
    'seks',
    'serial',
    'sława',
    'spa',
    'spokój',
    'sport',
    'spódnica',
    'sukces',
    'sukienka',
    'szpilki',
    'telefon',
    'uroda',
    'wczasy',
    'weekend',
    'willa',
    'władza',
    'zabawa',
    'zakupy'
  ];

  List<String> _text;

  @override
  void initState() {

    _text = List.of(text);
    _text.shuffle();

    if(widget.delay.inMilliseconds != 0) {
      show = false;
      run();
    } else {
      show = true;
    }
    super.initState();
  }

  bool show;

  Future<void> run() async {
    await Future.delayed(widget.delay);
    if(mounted) setState(() => show = true);
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: Dimen.TEXT_SIZE_BIG,
      child:
      show?
      FadeAnimatedTextKit(
        duration: Duration(milliseconds: 2800),
        repeatForever: true,
        text: _text,
        textStyle: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontWeight: weight.halfBold,
          color: hintEnab_(context)
        ),
        textAlign: TextAlign.center,
      ):
      Container()
    );
  }

}