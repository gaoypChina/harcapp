import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/slowo_klucz/word.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';
import 'main_game_page.dart';

class WordCard extends StatefulWidget{

  final SlowoKluczMainGamePageState parent;
  final Word word;
  final GameMode mode;

  const WordCard(this.parent, this.word, this.mode, {super.key});

  @override
  State<StatefulWidget> createState() => WordCardState();
}

class WordCardState extends State<WordCard>{

  SlowoKluczMainGamePageState get parent => widget.parent;
  Word get word => widget.word;
  CardColor? get cardColor => word.cardColor;
  Color? get color => word.color;

  GlobalKey<FlipCardState>? cardKey;

  late bool showLongPressMessage;
  
  bool? get selected => word.checked;
  set selected(value) => word.checked = value;

  Function get saveInstance => parent.saveInstance;

  bool get dimm => selected! && widget.mode==GameMode.LEADER;

  @override
  void initState() {
    cardKey = GlobalKey<FlipCardState>();
    showLongPressMessage = false;

    super.initState();
  }

  Color lighten(Color color, {double amount = .3}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {

    AutoSizeGroup group = AutoSizeGroup();

    Widget back = AppCard(
        radius: AppCard.bigRadius,
        margin: AppCard.normMargin,
        elevation: (!selected! && widget.mode==GameMode.LEADER)?AppCard.bigElevation:AppCard.defElevation,
        onTap: widget.mode==GameMode.LEADER && word.cardColor!=CardColor.kill?(){
          setState(() => word.checked = !word.checked!);
          saveInstance();
        }:null,
        color: dimm?Colors.grey[100]:color,
        child: RotatedBox(
          quarterTurns: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(widget.mode!=GameMode.LEADER)
                Transform.rotate(
                  angle: pi,
                  child: AutoSizeText(
                    widget.mode==GameMode.NONE?'':
                    word.data.data.toUpperCase(),
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: (cardColor==CardColor.kill)?
                      const ColorPackBlack().hintEnabled:AppColors.textHintEnab,
                    ),
                    textAlign: TextAlign.center,
                    group: group,
                    maxLines: 1,
                  ),
                ),

              if(widget.mode!=GameMode.LEADER)
                const SizedBox(height: Dimen.defMarg),

              AutoSizeText(
                widget.mode==GameMode.NONE?'':
                word.data.data.toUpperCase(),
                style: AppTextStyle(
                    color: (cardColor==CardColor.kill)?Colors.white:AppColors.textDefEnab.withOpacity(dimm?0.1:1),
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    shadow: !dimm),
                textAlign: TextAlign.center,
                group: group,
                maxLines: 1,
              ),
            ],
          ),
        )
    );

    if(widget.mode==GameMode.LEADER ||
      (widget.mode==GameMode.PLAYER && selected! && (cardKey!.currentState == null || cardKey!.currentState!.isFront)))
      return Expanded(child: back);

    Widget front = AppCard(
        radius: AppCard.bigRadius,
        margin: AppCard.normMargin,
        padding: EdgeInsets.zero,
        onTap:
        showLongPressMessage?
        null: ()async{
          if(mounted) setState(() => showLongPressMessage = true);
          await Future.delayed(const Duration(seconds: 2));
          if(mounted) setState(() => showLongPressMessage = false);
          saveInstance();
        },
        onLongPress: () => cardKey!.currentState!.toggleCard(),
        child: RotatedBox(
          quarterTurns: 1,
          child: AnimatedChildSlider(
            index: showLongPressMessage?1:0,
            children: [
              Padding(
                padding: AppCard.defPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Transform.rotate(
                      angle: pi,
                      child: AutoSizeText(
                        widget.mode==GameMode.NONE?'':
                        word.data.data.toUpperCase(),
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)), textAlign: TextAlign.center, group: group,),
                    ),

                    const SizedBox(height: Dimen.defMarg),

                    AutoSizeText(
                        widget.mode==GameMode.NONE?'':
                        word.data.data.toUpperCase(),
                        style: AppTextStyle(
                            color: textEnab_(context),
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.halfBold,
                            shadow: true),
                        textAlign: TextAlign.center,
                        group: group
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(MdiIcons.gestureTapHold, color: hintEnab_(context)),
                  ),

                  Expanded(
                    child: AppText('By obrócić, <b>przytrzymaj</b>', size: Dimen.TEXT_SIZE_SMALL, color: hintEnab_(context)),
                  )

                ],
              )

            ],
          ),
        )
    );

    return Expanded(
      child: FlipCard(
        direction: FlipDirection.VERTICAL,
        key: cardKey,
        flipOnTouch: false,
        front: front,
        back: back,
        speed: 500,
        onFlipDone: (bool _) async {

          setState(() => selected = !selected!);
          saveInstance();

          if(cardColor==CardColor.teamGreen) {
            widget.parent.greenCardsLeft--;
            if(widget.parent.greenCardsLeft == 0) {
              await openDialog(
                  context: context,
                  builder: (context) =>
                      const Center(
                        child: InfoWidget(
                          color: GREEN_COLOR,
                          textColor: AppColors.textDefEnab,
                          text: 'Wygrana!',
                        ),
                      )
              );
              ShaPref.remove(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME);
            }
          }

          else if(cardColor==CardColor.teamRed) {
            widget.parent.redCardsLeft--;
            if(widget.parent.redCardsLeft == 0) {
              await openDialog(
                  context: context,
                  builder: (context) =>
                      const Center(
                        child: InfoWidget(
                          color: RED_COLOR,
                          textColor: AppColors.textDefEnab,
                          text: 'Wygrana!',
                        ),
                      )
              );
              ShaPref.remove(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME);
            }
          }

          else if(cardColor==CardColor.kill) {
            await openDialog(
                context: context,
                builder: (context) =>
                    const Center(
                      child: InfoWidget(
                        color: Colors.black,
                        textColor: Colors.white,
                        text: 'Aj,\nTak wdepnąć...',
                      ),
                    )
            );
            ShaPref.remove(ShaPref.SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME);
            Navigator.pop(context);
          }
        },
      )
    );
  }

}